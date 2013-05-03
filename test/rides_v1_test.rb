require 'test/unit'
require 'mocha/setup'
require 'strava/v2/connection'
require 'strava/exceptions'
require 'strava/v2/models/athlete'
require 'json'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
require 'test_data'

class RidesV1Test < Test::Unit::TestCase

  def setup
    @s = Strava::V1::Connection.new
  end

  def test_rides_with_no_params
    Strava::V1::Connection.stubs(:get)
    .with("/#{@s.rides_path}", {:query => {}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_rides_no_params)))
    result = @s.rides()
    assert_equal(50, result.length)
  end

  def test_rides_with_invalid_param
    assert_raise Strava::RequestError do
      @s.rides({:made_up => "whatever"})
    end
  end

  def test_rides_with_two_valid_params
    Strava::V1::Connection.stubs(:get)
    .with("/#{@s.rides_path}", {:query => {:startId => 77563, :offset => 50}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_ride_start_id_and_offset)))
    rides = @s.rides({:start_id => 77563, :offset => 50})

    assert_equal(52127040, rides[0].id)
  end

  def test_getting_efforts_for_a_ride
    ride_id = 77563
    Strava::V1::Connection.stubs(:get)
    .with("/rides/#{ride_id}/efforts", {:query => {}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_efforts)))
    ride = @s.ride_with_efforts(ride_id)
    assert_equal(ride_id, ride.id)
    assert_equal(5819602, ride.efforts[0].id)
    assert_equal(640366, ride.efforts[0].segment.id)
  end

  def test_show_ride_details
    ride_id = 77563
    Strava::V1::Connection.stubs(:get)
    .with("/rides/#{ride_id}", {:query => {}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_show_ride_deets)))
    ride = @s.ride(ride_id)
    assert_equal(82369.1, ride.distance)
    assert_equal(1441.02, ride.elevation_gain)
    assert_equal("02/28/10 San Francisco, CA", ride.name)
    assert_equal("julianbill", ride.athlete.username)
    assert_equal(1139, ride.athlete.id)
  end
end