# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "feedjira/opml/version"

Gem::Specification.new do |spec|
  spec.name          = "feedjira-opml"
  spec.version       = Feedjira::OPML::VERSION
  spec.authors       = ["Chris Kalafarski"]
  spec.email         = ["chris@farski.com"]

  spec.summary       = "OPML parsing with Feedjira"
  spec.description   = "Rudimentary OPML parsing classes for Feedjira"
  spec.homepage      = "https://github.com/scour/feedjira-opml"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "coveralls", "~> 0"
  spec.add_development_dependency "rubocop", "~> 0"

  spec.add_runtime_dependency "feedjira", "~> 2.0"
end
