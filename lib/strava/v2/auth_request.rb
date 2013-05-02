require 'strava/v2/models/auth'

module Strava
  module V2
    module AuthRequest
      def login_path
        'authentication/login'
      end

      def login(email, password)
        auth = Auth.new(self.fetch(login_path(), {:email => email, :password => password}))
        self.set_authorized_user(auth.athlete.id, auth.token)
        return auth
      end
    end
  end
end