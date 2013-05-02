require 'strava/v1/rides_request'

module Strava
  module V1
    class Connection
      include HTTParty
      include Strava::V1::RidesRequest
      include Strava::BaseConnection

      base_uri 'http://www.strava.com/api/v1'
      format :json
    end
  end
end