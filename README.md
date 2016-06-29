# Clickatellsend

To use this gem you need to be registered in www.clicktell.com, and get an API ID. You can use almost every function of the clickatell API in a simple way,

TODO: Create parser for the callbacks of the clickatell API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clickatellsend'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clickatellsend

then run the generator:

    $ rails g clickatellsend

and go to config/initializers/clickatellsend.rb and fill with your credentials

```ruby
Clickatellsend.config do | config |
	config.clickatell_url
	config.clickatell_user
	config.clickatell_password
	config.clickatell_api_id
end
```

## Usage

we can use of the methods of the API in this way, perform a new request and receive the result in a json format

## Get a session ID
if you later don't want to send the messages with user and password
```ruby
request = Clickatellsend::Request.new
session = request.auth

message = request.send_msg(:to => 584141571411, :text => "I don't know", :session_id => session["OK"])
```

## Prevent the session expiring
```ruby
request = Clickatellsend::Request.new
session = request.auth

ping = request.prevent_expiring(:session_id => session["OK"])
```

## Send Message
```ruby
request = Clickatellsend::Request.new
message = request.send_msg(:to => 584141571411, :text => "I don't know")
```

## Send Message with delay
```ruby
request = Clickatellsend::Request.new
message = request.send_msg(:to => 584141571411, :text => "I don't know", :deliv_time => 15) #15 minutes
```

## Send Message to multiple recipients
```ruby
request = Clickatellsend::Request.new
message = request.send_msg(:to => "584141571411,1234,22234535456", :text => "I don't know")
```

## Get balance
```ruby
request = Clickatellsend::Request.new
balance = request.get_balance
```

## Get message charge
```ruby
request = Clickatellsend::Request.new
message = request.send_msg(:to => 584141571411, :text => "I don't know")

charge = request.get_msg_charge(:apimsgid => message["ID"])
```

## Route coverage
```ruby
request = Clickatellsend::Request.new
coverage = request.route_coverage(:msisdn => 584141571411)
```

## Get message status
```ruby
request = Clickatellsend::Request.new
message = request.send_msg(:to => 584141571411, :text => "I don't know")

status = request.get_msg_status(:apimsgid => message["ID"])
```

## Stop a message
```ruby
request = Clickatellsend::Request.new
message = request.send_msg(:to => 584141571411, :text => "I don't know", :deliv_time => 15) #15 minutes

stop = request.stop_msg(:apimsgid => message["ID"])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xploshioOn/clickatellsend. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

