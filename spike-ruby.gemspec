# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spike/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "spike-ruby"
  spec.version       = Spike::Ruby::VERSION
  spec.authors       = ["AKAMATSU Yuki"]
  spec.email         = ["y.akamatsu@ukstudio.jp"]
  spec.summary       = %q{Ruby library for SPIKE API}
  spec.description   = %q{Ruby library for SPIKE API}
  spec.homepage      = "http://spice-life/spike-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">=2.0.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "curb"
end
