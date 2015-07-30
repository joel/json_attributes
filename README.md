# JsonAttributes

[![Code Climate](https://codeclimate.com/github/joel/json_attributes.png)](https://codeclimate.com/github/joel/json_attributes)

[![Dependency Status](https://gemnasium.com/joel/json_attributes.svg)](https://gemnasium.com/joel/json_attributes)

[![Build Status](https://travis-ci.org/joel/json_attributes.svg?branch=master)](https://travis-ci.org/joel/json_attributes) (Travis CI)

[![Coverage Status](https://coveralls.io/repos/joel/json_attributes/badge.svg?branch=master&service=github)](https://coveralls.io/github/joel/json_attributes?branch=master)

[![Gem Version](https://badge.fury.io/rb/json_attributes.svg)](http://badge.fury.io/rb/json_attributes)

This gem allow you to use json column of last version of postgres sql in transparenlty manner, this means you can access on your attributes into the json like a normal attribute

For instance

define a Model with json column like that

```ruby
ActiveRecord::Schema.define do
  create_table(:users) do |t|
    t.string :name
    t.json   :office
  end
end
```

Define your model like that
```ruby
class User < ActiveRecord::Base
  include JsonAttributes
  json_attributes :office, :address
end
```

Create a instance
```ruby
user = User.create(name: 'John Doe', office: { address: '1 Infinite Loop, Cupertino, CA 95014' })
```

You can ask
```ruby
user.name # => 'John Doe'
user.name? # => true
user.name = 'Jane Doe'

user.address # => '1 Infinite Loop, Cupertino, CA 95014'
user.address? # => true
user.address = '75 Ninth Avenue 2nd and 4th Floors New York, NY 10011.'
```

You can use magic search methods as well
```ruby
User.find_by_name('John Doe') # => <#User:3456...>
User.find_by_address('1 Infinite Loop, Cupertino, CA 95014') # => <#User:3456...>
```

All attributes are provided through #attributes method
```ruby
user.attributes #=> { 'id'=>1, 'name'=>'John Doe', 'address'=>'1 Infinite Loop, Cupertino, CA 95014' }
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_attributes

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/json_attributes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
