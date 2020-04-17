# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'functionable/json/version'

Gem::Specification.new do |spec|
  spec.name          = 'functionable-json'
  spec.version       = Functionable::JSON::VERSION
  spec.authors       = ['Adrian Setyadi']
  spec.email         = ['a.styd@yahoo.com']

  spec.summary       = 'Generate JSON with JavaScript functions from ruby hash'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/styd/functionable-json'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir['lib/**/*', 'LICENSE.txt', 'README.md']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.12.2'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
