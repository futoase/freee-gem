# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freee/version'

Gem::Specification.new do |spec|
  spec.name          = "freee"
  spec.version       = Freee::VERSION
  spec.authors       = ["Keiji Matsuzaki"]
  spec.email         = ["futoase@gmail.com"]
  spec.summary       = %q{freee API.}
  spec.description   = %q{Ruby implementation of the freee API.}
  spec.homepage      = "https://github.com/futoase/freee-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'oauth2'
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_runtime_dependency 'httpauth'
  spec.add_runtime_dependency 'thor'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
