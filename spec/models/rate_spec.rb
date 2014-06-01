require 'spec_helper'

describe Rater::Rate do
  subject { Rater::Rate.new }

  it { should validate_presence_of(:value) }
  it { should belong_to(:rateable) }
end