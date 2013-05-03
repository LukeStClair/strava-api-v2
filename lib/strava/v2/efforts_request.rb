require 'strava/v2/models/effort'

module Strava
  module V2
    module EffortsRequest
      def efforts_path(id)
        "rides/#{id}/efforts"
      end

      def efforts_for_ride(ride_id)
        all_json = self.fetch(efforts_path(ride_id), {})

        all_efforts = []
        all_json["efforts"].each { |effort_json|
          all_efforts.push(Effort.new(effort_json["effort"], effort_json["segment"]))
        }
        all_efforts
      end
    end
  end
end