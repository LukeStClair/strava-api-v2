require 'strava/strava_response'
require 'strava/v2/models/segment'

module Strava
  module V2
    class Effort < StravaResponse
      attr_reader :id, :elapsed_time, :moving_time, :distance

      # Initialize the Effort
      # ejs - the effort JSON
      def initialize(ejs)
        @id = ejs["id"]
        @elapsed_time = ejs["elapsed_time"]
        @moving_time = ejs["moving_time"]
        @distance = ejs["distance"]
      end
    end
  end
end
