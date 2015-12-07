# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_unique_identifier/version'

Gem::Specification.new do |spec|
  spec.name          = "has_unique_identifier"
  spec.version       = HasUniqueIdentifier::VERSION
  spec.authors       = ["Sergey Besedin"]
  spec.email         = ["kr3ssh@gmail.com"]

  spec.summary       = "Make random unique identifiers with ease"
  spec.description   = ""
  spec.homepage      = "https://github.com/kressh/has_unique_identifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'rails', '>= 4.0'
end
