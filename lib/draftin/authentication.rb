module Draftin
  module Authentication
    def authentication
      if email && password
        { :email => email, :password => password }
      else
        {}
      end
    end
   
    def authenticated?
      !authentication.empty?
    end
  end
end