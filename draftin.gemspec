# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'draftin/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'faraday'
  
  spec.name          = "draftin"
  spec.version       = Draftin::VERSION
  spec.authors       = ["Adam Kirkwood"]
  spec.email         = ["adam@xyentific.com"]
  spec.description   = %q{Simple wrapper for the Draftin API}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/adamkirkwood/draftin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
