require 'test/unit'
require 'mocha/setup'
require 'strava/v2/connection'
require 'strava/exceptions'
require 'strava/v2/models/athlete'
require 'json'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
require 'test_data'

class EffortsV2Test < Test::Unit::TestCase

  def setup
    @s = Strava::V2::Connection.new
  end

  def test_get_efforts_for_ride
    ride_id = 448459
    Strava::V2::Connection.stubs(:get)
    .with("/rides/#{ride_id}/efforts", {:query => {}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_v2_efforts)))
    efforts = @s.efforts_for_ride(ride_id)
    assert efforts[0].is_a?(Strava::V2::Effort)
    assert_equal(45665444, efforts[0].id)
    assert_equal(12, efforts.length)
    assert_equal(634, efforts[0].elapsed_time)
    assert_equal(634, efforts[0].moving_time)
    assert_equal(5342.8, efforts[0].distance)
    assert_equal(852034, efforts[0].segment.id)
    assert_equal(1, efforts[0].segment.climb_category)
    assert_equal([37.771132132038474,-122.45532101020217], efforts[0].segment.start_latlng)
    assert_equal(-0.997671, efforts[0].segment.average_grade)
  end
end