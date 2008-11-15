
Merb::Authentication.activate!(:default_password_form)
Merb::Authentication.activate!(:default_basic_auth)
Merb::Authentication.activate!(:default_openid)


module Merb::Authentication::Strategies::Basic
  class OpenID < Merb::Authentication::Strategy
    def on_success!(response, sreg_response)

      if user = find_user_by_identity_url(response.identity_url)
        user
      else
        request.session[:'openid.url'] = response.identity_url
        required_reg_fields.each do |f|
          session[:"openid.#{f}"] = sreg_response.data[f] if sreg_response.data[f]
        end if sreg_response
        redirect!(Merb::Router.url(:signup))
      end
    end
  end
end