require 'test/unit'
require 'mocha/setup'
require 'strava/v1/connection'
require 'strava/v1/models/stream'
require 'strava/exceptions'
require 'json'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
require 'test_data'

class StreamTest < Test::Unit::TestCase

  def setup
    @s = Strava::V1::Connection.new
  end

  def test_successful_stream_fetch
    stream_id = 49807853

    Strava::V1::Connection.stubs(:get)
    .with("/streams/#{stream_id}", {:query => nil})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_stream)))
    stream = @s.stream(stream_id)
    assert stream.is_a?(Strava::V1::Stream)
    assert_equal(4873, stream.coordinates.length)
    assert_equal(99, stream.heartrates[0])
    assert_equal(2, stream.times[2])
    assert_equal(26096.0, stream.distances[stream.distances.length - 1])
    assert_equal(576.0, stream.altitudes[0])
  end
end