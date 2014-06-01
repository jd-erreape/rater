require 'spec_helper'

describe Rater::Rated do
  subject { Thing.new }

  it 'adds the polymorphic association' do
    expect(subject).to have_many(:rates)
  end

  describe '#rater' do
    let(:rater) { subject.rater }

    it 'returns a Rater::Client object initialized with the subject' do
      expect(rater).to be_instance_of(Rater::Client)
    end

    it 'initialize the Rater::Client with the rated object' do
      expect(rater.send('rated_object')).to eq(subject)
    end
  end
end