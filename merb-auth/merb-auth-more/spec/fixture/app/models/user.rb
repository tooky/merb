class User
  
  USERS = {
    "Fred" => "secret"
  }
  
  def self.authenticate(login, password)
    USERS[login] == password
  end
  
end
    