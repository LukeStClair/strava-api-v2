require 'strava/v1/models/ride'
require 'strava/v1/models/effort'

module Strava
  module V1
    module RidesRequest
      RIDES_PARAMS_MAP = {
        :club_id => :clubId,
        :athlete_id => :athleteId,
        :athlete_name => :athleteName,
        :start_date => :startDate,
        :end_date => :endDate,
        :start_id => :startId,
        :offset => :offset
      }

      def rides_path
        "rides"
      end

      def ride_path(id)
        "rides/#{id}"
      end

      def rides_with_efforts_path(id)
        rides_path + "/#{id}/efforts"
      end

      def rides(params = {})
        final_params = {}
        params.each_pair do |key, value|
          raise RequestError.new if RIDES_PARAMS_MAP[key].nil?
          final_params[RIDES_PARAMS_MAP[key]] = value
        end

        all_rides = []
        rides_array = self.fetch(rides_path(), final_params)["rides"]
        rides_array.each { |ride_json|
          all_rides.push(Ride.new(ride_json))
        }
        all_rides
      end

      def ride_with_efforts(ride_id)
        all_json = self.fetch(rides_with_efforts_path(ride_id), {})
        ride = Ride.new(all_json["ride"])
        all_segments = []
        all_json["efforts"].each { |effort_json|
          all_segments.push(Segment.new(effort_json["segment"], [effort_json]))
        }
        ride.segments = all_segments
        ride
      end

      def ride(ride_id)
        Ride.new(self.fetch(ride_path(ride_id), {})["ride"])
      end
    end
  end
end