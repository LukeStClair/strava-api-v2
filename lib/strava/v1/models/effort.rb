require 'strava/strava_response'
require 'strava/v1/models/segment'

module Strava
  module V1
    class Effort < StravaResponse
      attr_reader :id, :elapsed_time, :segment

      def initialize(js)
        @id = js["id"]
        @elapsed_time = js["elapsed_time"]
        @segment = Segment.new(js["segment"])
      end
    end
  end
end
