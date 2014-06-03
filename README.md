# Freee

Ruby implementation of the freee API.

## Installation

Add this line to your application's Gemfile:

    gem 'freee'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freee

## Usage

```ruby
require 'freee'

Freee::Base.config("#{client_id}", "#{secret_key}", "#{token}")
Freee::User.new.me
```

### Create token

```
> freee token
```

## Contributing

1. Fork it ( https://github.com/futoase/freee/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
