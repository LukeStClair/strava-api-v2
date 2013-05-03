require 'strava/strava_response'

module Strava
  module V1
    class Segment
      attr_reader :id, :name, :efforts

      # ejb - efforts json, in list form
      def initialize(jb, ejb)
        @id = jb["id"]
        @name = jb["name"]
        @efforts = []
        ejb.each { |effort_json|
          @efforts.push(Effort.new(effort_json))
        }
      end
    end
  end
end
