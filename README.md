# Freee

Ruby implementation of the freee API.

# Document

- [freee API v1.0](https://gist.github.com/yokoji/822edacff497b21fa7bf)(Japanese)

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

- Generate application token

```
> freee token \
  --client-id=$FREEE_CLIENT_ID \
  --secret-key=$FREEE_SECRET_KEY \
  --redirect-uri=$FREEE_REDIRECT_URI \
  --authorization-code=$FREEE_AUTHORIZATION_CODE
Token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
RefreshToken: YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
```

- Refresh application token

```
> freee token \
  --client-id=$FREEE_CLIENT_ID \
  --secret-key=$FREEE_SECRET_KEY \
  --redirect-uri=$FREEE_REDIRECT_URI \
  --refresh-token=$FREEE_REFRESH_TOKEN
Token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
RefreshToken: YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
```

## Contributing

1. Fork it ( https://github.com/futoase/freee/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
