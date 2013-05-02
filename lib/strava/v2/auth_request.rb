module Strava
  module V2
    module AuthRequest
      def login_path
        'authentication/login'
      end

      def login(email, password)
        self.fetch(login_path(), {:email => email, :password => password})
      end
    end
  end
end