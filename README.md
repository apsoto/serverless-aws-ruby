# serverless-aws-ruby

<p align="center">
    <a href="https://travis-ci.org/apsoto/serverless-aws-ruby.svg?branch=develop" alt="Build Status">
        <img src="https://travis-ci.org/apsoto/serverless-aws-ruby.svg?branch=develop" />
    </a>
</p>

Make testing/developing a ruby/AWS based [Serverless](https://www.serverless.com/) project.  

## Installation

Add this line to your application's Gemfile test group:

    gem 'serverless-aws-ruby', group: :test

Typically in a serverless project you are using the [serverless-ruby-package](https://www.npmjs.com/package/serverless-ruby-package), therefore you will run bundler in standalone mode:

    $ bundle install --standalone --path vendor/bundle

## Usage

### Invoke Handler Function in Test

```ruby
require 'test_helper'
require 'serverless/aws/ruby'
class HandlerTest < Minitest::Test
  def test_success_response
    event = Serverless::Aws::Ruby::HttpRequestEvent.new
    event.path = '/some/path'
    invoker = Serverless::Aws::Ruby::InvokeFunction.new(:my_function, event.to_h)
    response = invoker.call
    response_code = (response['statusCode'] || response[:statusCode]).to_i
    assert_equal(200, response_code)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### CI

[https://travis-ci.org/github/apsoto/serverless-aws-ruby](https://travis-ci.org/github/apsoto/serverless-aws-ruby)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apsoto/serverless-aws-ruby.

