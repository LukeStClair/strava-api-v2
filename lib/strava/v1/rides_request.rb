require 'strava/v1/models/ride'

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
        'rides'
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
        return all_rides
      end
    end
  end
end