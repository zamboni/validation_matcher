# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'validation_matcher/version'

Gem::Specification.new do |s|
  s.name        = 'validation_matcher'
  s.version     = ValidationMatcher::VERSION
  s.authors     = ['BM5k']
  s.email       = ['me@bm5k.com']
  s.homepage    = ""
  s.summary     = 'RSpec matcher for ActiveModel validations'
  s.description = 'Use reflection to spec ActiveModel validations'

  s.rubyforge_project = 'validation_matcher'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rspec', '~> 2.8.0'

  s.add_development_dependency 'supermodel'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-nav'
end
