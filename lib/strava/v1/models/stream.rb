require 'strava/strava_response'

module Strava
  module V1
    class Stream < StravaResponse
      attr_reader :coordinates, :heartrates, :times, :distances, :altitudes

      def initialize(jb)
        @coordinates = jb["latlng"]
        @heartrates = jb["heartrate"]
        @times = jb["time"]
        @distances = jb["distance"]
        @altitudes = jb["altitude"]
      end
    end
  end
end