require 'test/unit'
require 'mocha/setup'
require 'strava/v1/connection'
require 'strava/exceptions'
require 'strava/v1/models/club'
require 'json'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
require 'test_data'

class ClubsTest < Test::Unit::TestCase

  def setup
    @s = Strava::V1::Connection.new
  end

  def test_clubs
    club_name = "mission"

    Strava::V1::Connection.stubs(:get)
    .with("/clubs", {:query => {:name => club_name}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_clubs)))

    clubs = @s.clubs(club_name)

    assert clubs[0].is_a?(Strava::V1::Club)
    assert_equal(11, clubs.length)
    first = clubs[0]
    assert_equal("Mission Cycling", first.name)
    assert_equal(15, first.id)
  end
end