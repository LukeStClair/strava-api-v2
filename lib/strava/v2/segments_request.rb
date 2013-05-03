require 'strava/v2/models/segment'

module Strava
  module V2
    module SegmentsRequest
      def segments_and_efforts_for_ride_path(ride_id)
        "rides/#{ride_id}/efforts"
      end

      def segments_and_efforts_for_ride(ride_id)
        all_json = self.fetch(segments_and_efforts_for_ride_path(ride_id), {})
        all_segments = []
        all_json["efforts"].each { |effort_json|
          all_segments.push(Segment.new(effort_json["segment"], [effort_json["effort"]]))
        }
        all_segments
      end
    end
  end
end

