# MeetingFinder

Gem to assist in searching for AA meetings at intherooms.com

## Methods

Find meetings by name, location, address, day, time, fellowship, latitude, longitude
MeetingFinder::Search.find_by takes a search hash with those attributes as keys and the search strings as values.

For example:

```ruby
MeetingFinder::Search.find_by({"latitude" => 39.7316982, "longitude" => -104.9213643})
```

This gives back a MeetingFinder::Meeting object, from which you can access the various attributes using the following methods: 
name, location, address, day, time, fellowship, lat, lng

## Installation

Add this line to your application's Gemfile:

    gem 'meeting_finder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meeting_finder

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
