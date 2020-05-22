# frozen_string_literal: true

require 'serverless/ruby/invoke_function'

RSpec.describe Serverless::Ruby::InvokeFunction do
  let(:function_name) { 'a_function' }
  let(:serverless_yml) do
    <<-YML
    functions:
      a_function:
        handler: handler.a_function
    YML
  end
  subject { described_class.new(function_name) }

  context '#handler_method' do
    it 'should test FOO'
  end
end
