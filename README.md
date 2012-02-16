Validation Matchers
===================

Use Rails 3 validation reflection to test validations.

Installation
------------

Add to your Gemfile and run the `bundle` command to install it.

  ```ruby
  gem 'validation_matchers'
  ```

**Re  quires Ruby 1.9.2 or later.**

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
