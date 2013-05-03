require 'strava/strava_response'

module Strava
  module V1
    class Segment
      attr_reader :id, :name

      def initialize(jb)
        @id = jb["id"]
        @name = jb["name"]
      end
    end
  end
end
