require 'httparty'
require 'strava/exceptions'
require 'strava/v2/auth'

module Strava
  module V2
    class Connection
      include HTTParty
      include Strava::V2::Auth

      base_uri 'http://www.strava.com/api/v2'
      format :json

      def fetch(relative_uri, options)
        response = nil
        begin
          response = self.class.get("/#{relative_uri}", :query => options)
        rescue HTTParty::UnsupportedFormat, HTTParty::UnsupportedURIScheme, HTTParty::ResponseError, HTTParty::RedirectionTooDeep
          # if it's something we understand, it's probably a bad request.
          raise RequestError.new
        rescue Exception => e
          # anything else is presumably not from HTTParty - throw generic network error.
          raise NetworkError.new(e)
        end

        case response.code
          when 500...600
            raise StravaError.new
          when 404
            raise '404ed'
          when 200
            return response.parsed_response
        end
        raise NetworkError.new('Bad status ' + response.code.to_s)
      end
    end
  end
end
