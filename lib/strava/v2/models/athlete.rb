require 'strava/v2/models/strava_response'

module Strava
  module V2
    class Athlete < StravaResponse
      attr_reader :id, :name, :agreed_to_terms

      def initialize(json_blob)
        @id = json_blob["id"]
        @name = json_blob["name"]
        @agreed_to_terms = json_blob["agreed_to_terms"]
      end
    end
  end
end
