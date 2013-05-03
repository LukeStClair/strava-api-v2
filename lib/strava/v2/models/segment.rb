require 'strava/strava_response'
require 'strava/v2/models/effort'

module Strava
  module V2
    class Segment < StravaResponse
      attr_reader :id, :efforts, :name, :climb_category, :start_latlng, :end_latlng, :average_grade

      # include the efforts in the segment, if applicable
      # jb - the json for the segment
      # ejb - the json for the efforts, in a list
      def initialize(jb, ejb)
        @id = jb["id"]
        @name = jb["name"]
        @climb_category = jb["climb_category"]
        @start_latlng = jb["start_latlng"]
        @end_latlng = jb["end_latlng"]
        @average_grade = jb["avg_grade"]
        @efforts = []
        ejb.each { |effort_json|
          @efforts.push(Effort.new(effort_json))
        }
      end
    end
  end
end
