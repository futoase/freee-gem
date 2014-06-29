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

```sh
> export FREEE_CLIENT_ID=XXXXX
> export FREEE_SECRET_KEY=XXXXX
> export FREEE_APPLICATION_TOKEN=XXXXX
> irb
> require 'freee'
> Freee::Base.set_env
> Freee::User.me
{"user"=>{"email"=>"hoge@example.com", "display_name"=>nil, "first_name"=>nil, "last_name"=>nil, "first_name_kana"=>nil, "last_name_kana"=>nil}}
```

### Generate token

```
> freee token
```

## Contributing

1. Fork it ( https://github.com/futoase/freee/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
