require 'strava/v1/models/stream'

module Strava
  module V1
    module StreamRequest
      def streams_path(id)
        "streams/#{id}"
      end

      def stream(id)
        Stream.new(self.fetch(streams_path(id), nil))
      end
    end
  end
end