class BasicAuth < Application
  # before(nil) do 
  #  basic_authentication do |u,p|
  #     puts "THE USER IS #{u}, THE PASSWORD IS #{p}"
  #   end
  # end
 before :ensure_authenticated, :with => "Basic::BasicAuth"

  def index
    "BasicAuth#index"
  end
  
end