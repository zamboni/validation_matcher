%w[ validation_matchers supermodel pry pry-nav ].each { |lib| require lib }

class Thing < SuperModel::Base
  attr_accessor :field_a, :field_b
  validates :field_b, presence: true
end
