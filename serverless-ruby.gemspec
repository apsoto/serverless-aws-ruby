# frozen_string_literal: true

require_relative 'lib/serverless/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'serverless-ruby'
  spec.version       = Serverless::Ruby::VERSION
  spec.authors       = ['Alex Soto']
  spec.email         = ['apsoto@gmail.com']

  spec.summary       = 'Enhancements for developing ruby based Serverless Framework project.'
  spec.homepage      = 'https://github.com/apsoto/serverless-ruby'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/apsoto/serverless-ruby'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'debase'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'ruby-debug-ide'
  spec.add_development_dependency 'solargraph'
end
