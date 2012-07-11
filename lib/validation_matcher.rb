require 'validation_matcher/version'
require 'rspec'
require 'rspec-expectations'

module ValidationMatcher

  RSpec::Matchers.define :validate do |kind|

    chain(:of)   { |field| @field            = field }
    chain(:with) { |hash|  @expected_options = hash  }

    def options_message
      return '' unless diff.present?
      str  = "\n expected options: " + @expected_options.inspect
      str << "\n actual options: "   + validator_options.inspect
      str
    end

    description do
      msg  = "validate the #{ kind } of #{ @field.inspect }"
      msg << " with options: #{ @expected_options.inspect }" if @expected_options
      msg
    end

    failure_message_for_should do
      "Expected #{ described_class } to validate the #{ kind } of #{ @field.inspect } #{ options_message }"
    end

    failure_message_for_should_not do
      "Expected #{ described_class } not to validate the #{ kind } of #{ @field.inspect } #{ options_message }"
    end

    def validator
      @validator ||= actual.class.validators_on(@field).detect { |v| @expected.include? v.kind }
    end

    def validator_options
      @validator_options ||= validator.options rescue {}
    end

    def diff
      @diff ||= @expected_options ? validator_options.diff(@expected_options) : {}
    end

    match do |actual|
      validator.present? and diff.blank?
    end

  end

end
