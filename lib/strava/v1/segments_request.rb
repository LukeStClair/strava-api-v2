require 'strava/v1/models/segment'

module Strava
  module V1
    module SegmentRequest
      SEGMENT_PARAMS_MAP = {
          :club_id => :clubId,
          :athlete_id => :athleteId,
          :athlete_name => :athleteName,
          :start_date => :startDate,
          :end_date => :endDate,
          :start_id => :startId,
          :best => :best
      }

      def efforts_for_segment_path(id)
        "segments/#{id}/efforts"
      end

      def segment_with_efforts(id, params = {})
        final_params = {}
        params.each_pair do |key, value|
          raise RequestError.new if SEGMENT_PARAMS_MAP[key].nil?
          final_params[SEGMENT_PARAMS_MAP[key]] = value
        end
        all_json = self.fetch(efforts_for_segment_path(id), final_params)
        Segment.new(all_json["segment"], all_json["efforts"])
      end
    end
  end
end