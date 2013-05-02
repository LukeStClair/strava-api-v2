# Provides test data to be used in tests.
class TestData
  def self.test_login
    # curl -X POST --data "email=secureboot@gmail.com" --data "password=password" https://www.strava.com/api/v2/authentication/login
    '{"token":"thetoken","athlete":{"id":7976,"name":"Luke StClair","agreed_to_terms":true,"super_user":false,"iphone_tester":false,"push_token":null,"default_settings":{"sample_rate":3,"continuous_gps":true,"accuracy":0,"distance_filter":3,"max_search_time":30,"min_stale_time":300,"min_accuracy":150,"map_threshold":25,"max_sync_time":60,"max_waypoint_stale_time":300,"update_ride_poll_interval":2}},"activity_data":[]}'
  end
end