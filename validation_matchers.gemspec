# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'validation_matchers/version'

Gem::Specification.new do |s|
  s.name        = 'validation_matchers'
  s.version     = ValidationMatchers::VERSION
  s.authors     = ['BM5k']
  s.email       = ['me@bm5k.com']
  s.homepage    = ""
  s.summary     = 'TODO: Write a gem summary'
  s.description = 'TODO: Write a gem description'

  s.rubyforge_project = 'validation_matchers'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'supermodel'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-nav'
  # s.add_runtime_dependency "rest-client"
end
