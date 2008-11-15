require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe "password auth" do
  before(:all) do
    load File.expand_path(File.dirname(__FILE__) / ".." / "fixture" / "config" / "router.rb")
  end 
  
  it "should login with the correct credentials" do
    response = request("/password_auth", :params => {:login => "Fred", :password => "secret"})
    response.should be_successful
    response.body.to_s.should == "PasswordAuth#index"
  end
  
  it "should fail login with incorrect username" do
    response = request("/password_auth", :params => {:login => "not the username", :password => "secret"})
    response.status.should == Merb::Controller::Unauthenticated.status
  end
  
  it "should fail login with an incorrect password" do
    response = request("/password_auth", :params => {:login => "Fred", :password => "not the password"})
    response.status.should == Merb::Controller::Unauthenticated.status
  end

end