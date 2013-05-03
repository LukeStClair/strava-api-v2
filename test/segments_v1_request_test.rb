require 'test/unit'
require 'mocha/setup'
require 'strava/v1/connection'
require 'strava/v1/segments_request'
require 'strava/exceptions'
require 'json'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
require 'test_data'

class SegmentsV1RequestTest < Test::Unit::TestCase

  def setup
    @s = Strava::V1::Connection.new
  end

  def test_get_efforts_for_segment
    segment_id = 229781

    Strava::V1::Connection.stubs(:get)
    .with("/segments/#{segment_id}/efforts", {:query => {:best => true}})
    .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_v1_segment_efforts)))
    segment = @s.segment_with_efforts(segment_id, {:best => true})
    assert segment.is_a?(Strava::V1::Segment)
    assert segment.efforts[0].is_a?(Strava::V1::Effort)
    assert_equal(segment_id, segment.id)
    assert_equal(50, segment.efforts.length)
    first = segment.efforts[0]
    assert_equal(801006623, first.id)
    assert_equal(123529, first.athlete.id)
    assert_equal("jimwhimpey", first.athlete.username)
    assert_equal("Jim Whimpey", first.athlete.name)
  end

  def test_segment_with_bad_param
    assert_raise Strava::RequestError do
      @s.segment_with_efforts(12345, {:made_up => "whatever"})
    end
  end
end
