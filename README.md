Validation Matcher [![build status][status-image]][ci]
======================================================

About
-----

Use Rails 3 validation reflection to test validations.

URLs:

- Github:             https://github.com/bm5k/validation_matcher/
- Documentation:      http://rubydoc.info/github/BM5k/validation_matcher/master/frames
- RubyGems:           https://rubygems.org/gems/validation_matcher

Installation
------------

Add to your Gemfile and run the `bundle` command to install it.

  ```ruby
  gem 'validation_matcher'
  ```

**Requires Ruby 1.9.2 or later.**

Usage
-----

  ```ruby
  class Foo < ActiveRecord::Base
    validates :field_a, presence: true
    validates :field_b, uniquness: true
    validates :field_c, presence: true, uniquness: {case_insensitive: false}
  end

  require 'spec_helper'

  describe Subscription do

    its(:field_a) { should validate :presence }
    its(:field_b) { should validate :uniqueness }
    its(:field_c) { should validate :presence }
    its(:field_c) { should validate :uniqueness, { case_insensitive: false }}

  end
  ```

<!-- links -->
[ci]: http://travis-ci.org/BM5k/validation_matcher "build status"

<!-- images -->
[status-image]: https://secure.travis-ci.org/BM5k/validation_matcher.png?branch=master
