require 'strava/v1/models/ride'

module Strava
  module V1
    module RidesRequest
      def rides_path
        'rides'
      end

      def rides()
        all_rides = []
        rides_array = self.fetch(rides_path(), nil)["rides"]
        rides_array.each { |ride_json|
          all_rides.push(Ride.new(ride_json))
        }
        return all_rides
      end
    end
  end
end