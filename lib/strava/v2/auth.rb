module Strava
  module V2
    module Auth
      def login_path
        'authentication/login'
      end

      def login(email, password)
        self.fetch(login_path(), {:email => email, :password => password})
      end
    end
  end
end