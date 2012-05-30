require 'validation_matcher/version'

module ValidationMatcher

  RSpec::Matchers.define :validate do |kind|

    chain(:of)   { |field| @field   = field }
    chain(:with) { |hash|  @options = hash  }

    # simplify access to the described_class
    def described_class
      @described_class ||= actual.class
    end

    # Attempts to find the selected validator
    #
    # @param [Symbol] kind the type of validator we're looking for
    def find_validator kind
      described_class.validators_on(@field).detect { |v| v.kind == kind }
    end

    description do
      msg  = "validate the #{ kind } of #{ @field.inspect }"
      msg << " with options: #{ @options.inspect }" if @options
      msg
    end

    failure_message_for_should do
      msg  = "Expected #{ described_class } to validate the #{ kind } of #{ @field.inspect }"
      msg << "\n with options: #{ @options.inspect }" if @options.present?
      msg
    end

    failure_message_for_should_not do
      msg  = "Expected #{ described_class } not to validate the #{ kind } of #{ @field.inspect }"
      msg << "\n with options: #{ @options.inspect }" if @options.present?
      msg
    end

    match do |actual|
      validator = find_validator kind
      options   = validator.options rescue {}
      diff      = @options ? options.diff(@options) : nil
      @options = nil # for some reason this appears to be cached between runs?

      validator.present? and diff.blank?
    end

  end

end
