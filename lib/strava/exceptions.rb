module Strava
  class StravaError < StandardError; end

  class RequestError < StandardError; end

  class NetworkError < StandardError; end
end