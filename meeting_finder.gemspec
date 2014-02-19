# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meeting_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "meeting_finder"
  spec.version       = MeetingFinder::VERSION
  spec.authors       = ["Ben Lewis", "Ben Horne", "Billy Griffin"]
  spec.email         = ["bennlewis@gmail.com", "benhorne44@gmail.com", "navyosu@gmail.com"]
  spec.description   = "Gem to assist in searching for AA meetings at intherooms.com"
  spec.summary       = "Find AA Meetings more easily!"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "nokogiri"
end
