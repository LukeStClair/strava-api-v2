require 'strava/v1/models/club'

module Strava
  module V1
    module ClubsRequest
      def clubs_path
        "clubs"
      end

      def clubs(name)
        all_clubs = []
        self.fetch(clubs_path, {:name => name})["clubs"].each { |club_json|
          all_clubs.push(Club.new(club_json))
        }
        all_clubs
      end
    end
  end
end

