# HasUniqueIdentifier

[![Gem Version](https://badge.fury.io/rb/has_unique_identifier.svg)](http://badge.fury.io/rb/has_unique_identifier)
[![Code Climate](https://codeclimate.com/github/kressh/has_unique_identifier/badges/gpa.svg)](https://codeclimate.com/github/kressh/has_unique_identifier)

This gem provides unique identifier generation

Supporting ORM are ActiveRecord and Sequel (through [sequel-rails](https://github.com/TalentBox/sequel-rails) gem)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'has_unique_identifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_unique_identifier

## Usage

### ActiveRecord

```ruby
class User < ActiveRecord::Base
  has_unique_identifier :sid, to_param: true
end
```

### Sequel

```ruby
class Event < Sequel::Model
  has_unique_identifier :id, only_numbers: true, to_param: true
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kressh/has_unique_identifier.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

