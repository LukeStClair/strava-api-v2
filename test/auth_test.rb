require 'test/unit'
require 'mocha/setup'
require 'strava/v2/connection'
require 'strava/exceptions'
require 'json'
require 'pp'
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
  end
end