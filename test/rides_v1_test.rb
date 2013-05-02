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
    .with("/#{@s.rides_path}", {:query => nil})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_rides_no_params)))
    result = @s.rides()
    assert_equal(50, result.length)
  end
end