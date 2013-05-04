# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'strava/version'

Gem::Specification.new do |spec|
  spec.name          = "strava-api-v2"
  spec.version       = Strava::VERSION
  spec.authors       = ["Luke StClair"]
  spec.email         = ["secureboot@gmail.com"]
  spec.description   = %q{API to access strava API, v2}
  spec.summary       = %q{Provides access to the strava v1 and v2 apis, which are soon to be deprecated}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "mocha"
end
