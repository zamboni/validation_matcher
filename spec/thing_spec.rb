require 'spec_helper'

describe Thing do

  it { should_not validate(:presence).of :field_a }
  it { should     validate(:presence).of :field_b }

  it { should_not validate(:numericality).of :field_c }
  it { should_not validate(:numericality).of(:field_c).with only_integer: true }
  it { should     validate(:numericality).of(:field_c).with only_integer: true, allow_nil: false }

end
