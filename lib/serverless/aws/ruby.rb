# frozen_string_literal: true

require 'serverless/aws/ruby/version'

module Serverless
  module Aws
    # rubocop:disable Style/Documentation
    module Ruby
      # class Error < StandardError; end
      # Your code goes here...
    end
    # rubocop:enable Style/Documentation
  end
end

require_relative './ruby/fake_lambda_context'
require_relative './ruby/handler_method'
require_relative './ruby/http_request_event'
require_relative './ruby/invoke_function'
