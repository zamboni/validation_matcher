%w[ validation_matcher active_support/core_ext active_model pry pry-nav ].each { |lib| require lib }

class Thing

  extend  ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :field_a, :field_b, :field_c

  validates :field_b, presence: true
  validates :field_c, numericality: { allow_nil: false, only_integer: true }

end
