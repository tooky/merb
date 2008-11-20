class PasswordAuth < Application
  before :ensure_authenticated, :with => "Basic::Form"
  
  def index
    "PasswordAuth#index"
  end
  
  
end