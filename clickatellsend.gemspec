# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clickatellsend/version'

Gem::Specification.new do |spec|
  spec.name          = "clickatellsend"
  spec.version       = Clickatellsend::VERSION
  spec.authors       = ["xploshioOn"]
  spec.email         = ["humber.m23@gmail.com"]

  spec.summary       = %q{Gem to work with Clickatell SMS Gateway API}
  spec.description   = %q{You can use almost every function of the clickatell API in a simple way}
  spec.homepage      = "https://github.com/xploshioOn/clickatellsend"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rest-client", "~> 2.0"
end
