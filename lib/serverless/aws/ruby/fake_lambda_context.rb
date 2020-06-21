# frozen_string_literal: true

module Serverless
  module Aws
    module Ruby
      # Context for Lambda Function
      # Thanks to serverless node package
      # https://github.com/serverless/serverless/blob/master/lib/plugins/aws/invokeLocal/invoke.rb
      class FakeLambdaContext
        attr_reader :function_name, :function_version

        def initialize(name: 'Fake', version: 'LATEST', timeout: 6, **options)
          @function_name = name
          @function_version = version
          @created_time = Time.now
          @timeout = timeout
          options.each do |k, v|
            send(k, v)
          end
        end

        # rubocop:disable Naming/AccessorMethodName
        def get_remaining_time_in_millis
          [@timeout * 1000 - ((Time.now - @created_time) * 1000).round, 0].max
        end
        # rubocop:enable Naming/AccessorMethodName

        def invoked_function_arn
          "arn:aws:lambda:serverless:#{function_name}"
        end

        def memory_limit_in_mb
          '1024'
        end

        def aws_request_id
          '1234567890'
        end

        def log_group_name
          "/aws/lambda/#{function_name}"
        end

        def log_stream_name
          Time.now.strftime('%Y/%m/%d') + '/[$' + function_version + ']58419525dade4d17a495dceeeed44708'
        end

        def log(message)
          puts message
        end
      end
    end
  end
end
