# Strava::Api::V2

API for accessing the strava V2 API - (http://bit.ly/161qmXg)

## Installation

Add this line to your application's Gemfile:

    gem 'strava-api-v2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install strava-api-v2

## Usage

This module includes both versions of the API (at least the sparse parts I was interested in putting
together. The confusing thing is that you'll probably have to mix and match to get things done that you care about.

## Getting a connection

The connection object is used to interact with Strava's servers.

    $ connection_v1 = Strava::V1::Connection.new
    $ connection_v2 = Strava::V2::Connection.new

## Fetching rides

Get a random sampling of all rides

    $ rides = connection_v1.rides

Or you can pass in parameters to get a more useful subset of rides.

For instance, to get the top rides from a club
    $ rides = connection_v1.rides(:club_id => 15)

Or get the rides for a given athlete
    $ rides = connection_v1.rides(:athlete_id = > 7679)

Other parameters include :athlete_name, :start_date, :end_date, :start_id, and :offset (http://bit.ly/18CrfCa)

## Streams

Get the stream information about a ride, including heart rates, coordinates, times, distances, altitudes of points
sampled on a ride.

    $ stream = connection_v1.stream(ride_id)

## Efforts for segment

You can find all the efforts for a segment in the following way

    $ segment = connection_v1.segment_with_efforts(segment_id, params)
    $ efforts = segment.efforts

The efforts can be search by different parameters, including :club_id, :athlete_id, :athlete_name, :start_date,
:end_date, :start_id, :best => true

## Getting clubs

Search for club by name

    $ clubs = connection_v1.rides(:name => "Mission Cycling")

## Authenticating

See http://bit.ly/18Ctky9 for more details - this also enables you to retrieve tokens and athlete information.

    $ auth = connection_v2.login("email@example.com", "password")
    $ token = auth.token
    $ athlete = auth.athlete

## Segments for a given ride

See http://bit.ly/125MoTh for more details - this allows you to look up the segments for a given ride

    $ segments = connection_v2.segments_for_ride(ride_id)
    $ first_segment_efforts = segments[0].efforts

## All efforts for a given ride

See http://bit.ly/125MoTh - looks up all efforts put out in a given ride.

    $ segments = connection_v2.segments_and_efforts_for_ride(ride_id)
    $ first_effort = segments[0].efforts[0]

## Issues

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
