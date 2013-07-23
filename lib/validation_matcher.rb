require 'validation_matcher/version'
require 'rspec'

module ValidationMatcher

  RSpec::Matchers.define :validate do |kind|

    chain(:of)   { |field| @field            = field }
    chain(:with) { |hash|  @expected_options = hash }

    description do
      msg  = "validate the #{ kind } of #{ @field.inspect }"
      msg << " with options: #{ @expected_options.inspect }" if @expected_options
      @expected_options = nil # for some reason this appears to be cached between runs?
      msg
    end

    failure_message_for_should do
      "Expected #{ described_class } to validate the #{ kind } of #{ @field.inspect } #{ diff }"
    end

    failure_message_for_should_not do
      "Expected #{ described_class } not to validate the #{ kind } of #{ @field.inspect } #{ diff }"
    end

    def expected_options
      @expected_options || {}
    end

    def validator
      @validator ||= actual.class.validators_on(@field).detect { |v| @expected.include? v.kind }
    end

    def validator_options
      @validator_options ||= validator.options rescue {}
    end

    def diff?
      # if validator_options is empty and @expected_options is not, there is a problem
      # if @expected_options is empty and validator_options is not, there is a problem
      # if neither is empty diff them, if there's a diff, there is a problem

      return true if expected_options.present? ^ validator_options.present?
      return true if validator_options.diff(expected_options).present?
      false
    end

    def diff
      return '' unless diff?
      str  = "\n expected options: #{ expected_options.inspect }"
      str << "\n actual options: #{ validator_options.inspect }"
      str
    end

    match do |actual|
      validator.present? and not diff?
    end

  end

end
