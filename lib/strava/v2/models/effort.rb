require 'strava/strava_response'
require 'strava/v2/models/segment'

module Strava
  module V2
    class Effort < StravaResponse
      attr_reader :id, :elapsed_time, :moving_time, :distance, :segment

      # Initialize the Effort
      # We include the segment as part of the effort, since they're pretty related
      # ejs - the effort JSON
      # sjs - the segment JSON
      def initialize(ejs, sjs)
        @id = ejs["id"]
        @elapsed_time = ejs["elapsed_time"]
        @moving_time = ejs["moving_time"]
        @distance = ejs["distance"]
        @segment = Segment.new(sjs)
      end
    end
  end
end
