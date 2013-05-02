require 'test/unit'
require 'mocha/setup'

require 'strava/v2/connection'
require 'strava/exceptions'

class V2ConnectionTest < Test::Unit::TestCase
  def setup
    @relative_uri = "made_up_uri"
    @s = Strava::V2::Connection.new
  end

  def test_creatable
    assert @s.is_a?(Strava::V2::Connection)
  end

  def test_valid_response_code
    Strava::V2::Connection.stubs(:get).with("/#{@relative_uri}", :query => nil)
      .returns(stub(:code => 200, :parsed_response => {:stuff => "other stuff"}))
    @s.fetch(@relative_uri, nil)
  end

  def test_unsupported_uri_scheme
    Strava::V2::Connection.stubs(:get).raises(HTTParty::UnsupportedURIScheme.new)
    assert_raise Strava::RequestError do
      @s.fetch(@relative_uri, nil)
    end
  end

  def test_strava_error_response_code
    Strava::V2::Connection.stubs(:get).with("/#{@relative_uri}", :query => nil)
      .returns(stub(:code => 500))
    assert_raise Strava::StravaError do
      @s.fetch(@relative_uri, nil)
    end
  end
end