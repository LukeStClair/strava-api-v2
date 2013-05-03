require 'strava/v2/models/effort'

module Strava
  module V2
    module EffortsRequest
      def efforts_path(id)
        "rides/#{id}/efforts"
      end

      def segments_for_ride(ride_id)
        all_json = self.fetch(efforts_path(ride_id), {})

        all_segments = []
        all_json["efforts"].each { |effort_json|
          all_segments.push(Segment.new(effort_json["segment"], [effort_json["effort"]]))
        }
        all_segments
      end
    end
  end
end