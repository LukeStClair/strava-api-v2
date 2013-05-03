require 'strava/strava_response'
require 'strava/v1/models/segment'
require 'strava/v1/models/athlete'

module Strava
  module V1
    class Effort < StravaResponse
      attr_reader :id, :elapsed_time, :athlete

      def initialize(js)
        @id = js["id"]
        @elapsed_time = js["elapsed_time"]
        @athlete = Athlete.new(js["athlete"]) if !js["athlete"].nil?
      end
    end
  end
end
