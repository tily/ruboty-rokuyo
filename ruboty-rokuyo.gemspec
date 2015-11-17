# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/rokuyo/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-rokuyo"
  spec.version       = Ruboty::Rokuyo::VERSION
  spec.authors       = ["tily"]
  spec.email         = ["tidnlyam@gmail.com"]

  spec.summary       = %q{ruboty plugin for displaying rokuyo information}
  spec.description   = %q{ruboty plugin for displaying rokuyo information}
  spec.homepage      = "https://github.com/tily/ruboty-rokuyo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_dependency "qreki"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
