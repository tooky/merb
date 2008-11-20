require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')
require 'base64'

describe "Basic Auth" do
  before(:all) do
    load File.expand_path(File.dirname(__FILE__) / ".." / "fixture" / "config" / "router.rb")
  end 
  
  def credentials(username = "Fred", password = "secret")
    env = {}
    env["X_HTTP_AUTHORIZATION"] = "Basic #{Base64.encode64("#{username}:#{password}")}"
    env
  end
  
  it "should login with the correct credentials" do
    response = request("/basic_auth", credentials)
    response.should be_successful
    response.body.to_s.should == "BasicAuth#index"
  end
  
  it "should fail login with incorrect username" do
    response = request("/basic_auth", credentials("fred"))
    response.status.should == Merb::Controller::Unauthenticated.status
  end
  
  it "should fail login with an incorrect password" do
    response = request("/basic_auth", credentials("Fred", "not the password"))
    response.status.should == Merb::Controller::Unauthenticated.status
  end

end