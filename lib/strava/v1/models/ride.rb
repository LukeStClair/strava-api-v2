require 'strava/strava_response'
require 'strava/v1/models/athlete'

module Strava
  module V1
    class Ride < StravaResponse
      attr_reader :id, :name, :distance, :moving_time, :average_speed, :average_watts, :name, :elevation_gain, :athlete
      attr_accessor :segments

      def initialize(json)
        @id = json["id"]
        @name = json["name"]
        @distance = json["distance"]
        @moving_time = json["moving_time"]
        @average_speed = json["average_speed"]
        @average_watts = json["average_watts"]
        @name = json["name"]
        @elevation_gain = json["elevationGain"]
        @athlete = Athlete.new(json["athlete"]) if !json["athlete"].nil?
      end
    end
  end
end