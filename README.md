# paynet-api [ ![Codeship Status for liftforward/paynet-api](https://codeship.com/projects/6b0c0240-9794-0133-be98-668c447e66c0/status?branch=master)](https://codeship.com/projects/125854)

paynet-api is a ruby gem client for the Paynet API. It's currently a work in progress and only supports limited API functionality.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paynet-api'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install paynet-api
```

## Usage

### Configuration

TODO

### Working with the API

TODO

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Running the integration suite

To run the integration suite you will need credentials from Paynet. Once you have your credentials set them in the following environment variables:
```
BASIC_AUTH_USER={ your paynet api user name }
BASIC_AUTH_PASSWORD={ your paynet api password }
BASE_URL={ base url for api. Everything before the endpoints }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/liftforward/paynet-api.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
