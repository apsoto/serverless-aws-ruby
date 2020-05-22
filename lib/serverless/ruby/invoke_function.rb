# frozen_string_literal: true

require 'yaml'

module Serverless
  module Ruby
    # Invoke handler, same as serverless invoke local command.
    # Has the benefit of running in the same process as your test so you can
    # step debug, include code coverage.
    # @example Invoke function with http event
    #   require 'test_helper'
    #   require 'serverless/ruby'
    #   class HandlerTest < Minitest::Test
    #     def test_success_response
    #       event = Serverless::Ruby::HttpRequestEvent.new
    #       event.path = '/some/path'
    #       invoker = Serverless::Ruby::InvokeFunction.new(:my_function, event.to_h)
    #       response = invoker.call
    #       response_code = response['statusCode'] || response[:statusCode]
    #       assert_equal(200, response_code.to_i)
    #     end
    #   end
    class InvokeFunction
      # @param function_name [Symbol] the name used in the *functions:* block in serverless.yml
      # @param event [Hash] event hash to pass to handler
      # @param context [Hash] optional context data to pass to handler
      def initialize(function_name, event, context = {})
        @function_name = function_name
        @event = event
        @context = FakeLambdaContext.new(context)
      end

      def call
        result = handler_method.call(event: @event, context: @context)
        result
      end

      # return handler method to invoke
      def handler_method
        # assumed CWD is where serverless.yml is.
        # At some point this might need to be configurable
        serverless_yml = YAML.safe_load(File.read('serverless.yml'))
        handler_config = serverless_yml['functions'][@function_name.to_s]['handler']
        HandlerMethod.new(handler_config)
        # handler name is either a global method or a static method in a class
        # my_method or MyModule::MyClass.my_method
        # handler_method_name, handler_class = handler_name.split('.').reverse
        # handler_class ||= 'Kernel'
        # klass = Object.const_get(handler_class)
        # klass.method(handler_method_name)
      end
end
  end
end
