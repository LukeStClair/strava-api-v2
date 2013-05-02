module Strava
  module V2
    module RidesRequest
      def rides_request_path(id)
        "rides/#{id}"
      end
    end
  end
end