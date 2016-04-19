# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spike/version'

Gem::Specification.new do |spec|
  spec.name          = "spike-ruby"
  spec.version       = Spike::VERSION
  spec.authors       = ["AKAMATSU Yuki"]
  spec.email         = ["y.akamatsu@ukstudio.jp"]
  spec.summary       = %q{Ruby library for SPIKE API}
  spec.description   = %q{Ruby library for SPIKE API}
  spec.homepage      = "http://github.com/spice-life/spike-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">=2.0.0"

  spec.add_development_dependency "bundler", ">= 1.0.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "simplecov"

  spec.add_dependency "curb", "~> 0.8.6"
  spec.add_dependency "activesupport", ">=3.0.0"
end
