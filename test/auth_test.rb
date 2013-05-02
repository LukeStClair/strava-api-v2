require 'test/unit'
require 'mocha/setup'
require 'strava/v2/connection'
require 'strava/exceptions'
require 'strava/v2/models/athlete'
require 'json'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
require 'test_data'

class AuthTest < Test::Unit::TestCase

  def setup
    @s = Strava::V2::Connection.new
  end

  def test_successful_auth
    email = 'secureboot@gmail.com'
    password = 'notatallreal'

    Strava::V2::Connection.stubs(:get)
      .with("/#{@s.login_path}", {:query => {:email => email, :password => password}})
      .returns(stub(:code => 200, :parsed_response => (JSON.parse TestData.test_login)))
    result = @s.login(email, password)
    assert_equal("thetoken", result.token)
    # make sure the athlete parses out okay.
    assert result.athlete.is_a?(Strava::V2::Athlete)

    # be sure the auth for the connection gets set
    assert_equal(7976, @s.user_id)
    assert_equal("thetoken", @s.token)
  end
end