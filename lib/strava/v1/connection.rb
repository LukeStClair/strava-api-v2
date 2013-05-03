require 'strava/v1/rides_request'
require 'strava/v1/streams_request'
require 'strava/v1/segments_request'
require 'strava/v1/clubs_request'

module Strava
  module V1
    class Connection
      include HTTParty
      include Strava::V1::RidesRequest
      include Strava::V1::StreamRequest
      include Strava::V1::SegmentRequest
      include Strava::V1::ClubsRequest
      include Strava::BaseConnection

      base_uri 'http://www.strava.com/api/v1'
      format :json
    end
  end
end