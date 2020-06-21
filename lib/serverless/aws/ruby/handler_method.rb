# frozen_string_literal: true

module Serverless
  module Aws
    module Ruby
      # The ruby handler method to call via InvokeLocal
      class HandlerMethod
        # @param handler_config [String] the `handler:` config from serverless.yml
        def initialize(handler_config)
          @handler_config = handler_config
        end

        def call(event:, context:)
          load_method.call(event: event, context: context)
        end

        def load_method
          # config string pattern is:
          # PATH.[NAMESPACE::]CLASS.CLASSMETHOD
          # - require 'path'
          # - constantize class
          # - return reference to class method
          # handler name is either a global method or a static method in a class
          # my_method or MyModule::MyClass.my_method
          path, handler = @handler_config.split('.')
          require_handler_file(path)
          handler_method_name, handler_class = handler.split('.').reverse
          handler_class ||= 'Kernel'
          klass = Object.const_get(handler_class)
          klass.method(handler_method_name)
        end

        def require_handler_file(path)
          # add path dir to LOAD_PATH if it does not exist
          unless $LOAD_PATH.include?(File.dirname(path)) || $LOAD_PATH.include?(File.expand_path(File.dirname(path)))
            # best practice to add expanded path to LOAD_PATH
            # '/full/path/' is always known, './path' can be different relative to CWD
            $LOAD_PATH.prepend(File.expand_path(File.dirname(path)))
          end

          require(path)
        end
      end
    end
  end
end
