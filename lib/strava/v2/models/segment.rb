require 'strava/strava_response'

module Strava
  module V2
    class Segment < StravaResponse
      attr_reader :id, :name, :climb_category, :start_latlng, :end_latlng, :average_grade

      def initialize(jb)
        @id = jb["id"]
        @name = jb["name"]
        @climb_category = jb["climb_category"]
        @start_latlng = jb["start_latlng"]
        @end_latlng = jb["end_latlng"]
        @average_grade = jb["avg_grade"]
      end
    end
  end
end
