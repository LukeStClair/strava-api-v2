require 'strava/strava_response'

module Strava
  module V1
    class Athlete < StravaResponse
      attr_reader :id, :username, :name

      def initialize(jb = {})
        @id = jb["id"]
        @username = jb["username"]
        @name = jb["name"]
      end
    end
  end
end