require 'httparty'
require 'strava/base_connection'
require 'strava/exceptions'
require 'strava/v2/auth_request'
require 'strava/v2/efforts_request'
require 'strava/v2/segments_request'

module Strava
  module V2
    class Connection
      include HTTParty
      include Strava::BaseConnection
      include Strava::V2::AuthRequest
      include Strava::V2::EffortsRequest
      include Strava::V2::SegmentsRequest

      attr_reader :user_id, :token
      base_uri 'http://www.strava.com/api/v2'
      format :json

      def set_authorized_user(user_id, token)
        @user_id = user_id
        @token = token
      end
    end
  end
end
