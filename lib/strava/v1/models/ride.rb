require 'strava/strava_response'

module Strava
  module V1
    class Ride < StravaResponse
      attr_reader :id, :name

      def initialize(json)
        @id = json["id"]
        @name = json["name"]
      end
    end
  end
end