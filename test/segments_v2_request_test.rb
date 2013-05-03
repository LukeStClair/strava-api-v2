require 'test/unit'
require 'mocha/setup'
require 'strava/v2/connection'
require 'strava/v2/segments_request'
require 'strava/exceptions'
require 'json'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
require 'test_data'

class SegmentsV2RequestTest < Test::Unit::TestCase

  def setup
    @s = Strava::V2::Connection.new
  end

  def test_get_efforts_for_segment
    ride_id = 448459
    segment_id = 852034

    Strava::V2::Connection.stubs(:get)
    .with("/rides/#{ride_id}/efforts", {:query => {}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_v2_segment_efforts)))
    segments = @s.segments_and_efforts_for_ride(ride_id)
    segment = segments[0]

    assert segment.is_a?(Strava::V2::Segment)
    assert segment.efforts[0].is_a?(Strava::V2::Effort)

    assert_equal("The Park Going West", segment.name)
    assert_equal(segment_id, segment.id)
    assert_equal(1, segment.efforts.length)
    assert_equal(12, segments.length)
    assert_equal([37.771132132038474,-122.45532101020217], segment.start_latlng)
    assert_equal([37.77060532942414,-122.5106082111597], segment.end_latlng)

    first = segment.efforts[0]
    assert_equal(45665444, first.id)
    assert_equal(634, first.elapsed_time)
    assert_equal(634, first.moving_time)
    assert_equal(5342.8, first.distance)
  end
end





