# frozen_string_literal: true

require 'serverless/ruby/handler_method'

RSpec.describe Serverless::Ruby::HandlerMethod do
  context '#load_method' do
    before(:all) do
      # add dummy files to LOAD_PATH
    end

    after(:all) do
      # restore LOAD_PATH
    end

    # PATH.[NAMESPACE::]CLASS.CLASSMETHOD
    # 'lib/ssai/serverless/create_handler.Ssai::Serverless::CreateHandler.handle'
    # handler.handler_method
    it 'load method from standalone handler file' do
      skip
    end

    it 'load method from class' do
      skip
    end
  end
end
