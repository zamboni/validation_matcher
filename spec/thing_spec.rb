require 'spec_helper'

describe Thing do

  its(:field_a) { should_not validate :presence }
  its(:field_b) { should     validate :presence }

end
