require 'strava/strava_response'
require 'strava/v2/models/athlete'

module Strava
  module V2
    class Auth < StravaResponse
      attr_reader :token, :athlete

      def initialize(json_blob)
        @token = json_blob["token"]
        @athlete = Athlete.new(json_blob["athlete"])
      end
    end
  end
end
