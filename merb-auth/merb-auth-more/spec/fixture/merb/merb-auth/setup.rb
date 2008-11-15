# Sets the default class ofr authentication.  This is primarily used for 
# Plugins and the default strategies
Merb::Authentication.user_class = User 


# Mixin the salted user mixin
require 'merb-auth-more/mixins/salted_user'
Merb::Authentication.user_class.class_eval{ include Merb::Authentication::Mixins::SaltedUser }
  
# Setup the session serialization
class Merb::Authentication

  def fetch_user(session_user)
    session_user
  end

  def store_user(user)
    user
  end
end