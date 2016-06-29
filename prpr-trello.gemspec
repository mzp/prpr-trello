# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prpr/trello/version'

Gem::Specification.new do |spec|
  spec.name          = "prpr-trello"
  spec.version       = Prpr::Trello::VERSION
  spec.authors       = ["mzp"]
  spec.email         = ["mzpppp@gmail.com"]

  spec.summary       = "Prpr plugin to connect github to trell"
  spec.description   = "When PR status changed, move trello card"
  spec.homepage      = "https://github.com/mzp/prpr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "prpr"
  spec.add_dependency "ruby-trello"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
