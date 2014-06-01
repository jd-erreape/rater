require 'spec_helper'

describe Rater::Client do
  let(:thing) { Thing.create! }
  let(:rates) { [
    Rater::Rate.create!(value: rand(10)),
    Rater::Rate.create!(value: rand(10)),
    Rater::Rate.create!(value: rand(10))
  ] }

  before do
    thing.send(:rates=, rates)
    thing.save!
  end

  subject { Rater::Client.new(thing) }

  describe '#rates' do
    context 'no rates' do
      before do
        destroy_thing_rates
      end

      it 'returns an empty array' do
        expect(subject.rates).to be_empty
      end
    end

    context 'rates' do
      it 'return an array of rate objects' do
        expect(subject.rates).to eq(rates)
      end

      it 'refresh the association when first param is true' do
        expect(subject.rates).to eq(rates)

        Rater::Rate.destroy_all

        expect(subject.rates).to eq(rates)
        expect(subject.rates(true)).to be_empty
      end
    end
  end

  describe '#add' do
    let(:new_rate_args) { {value: rand(10)} }

    it 'adds a rate to the rated object rates' do
      expect { subject.add(new_rate_args) }.to change { subject.rates.count }.by(1)

      expect(subject.rates(true).last.value).to eq(new_rate_args[:value])
    end

    it 'returns the added rate' do
      new_rate = subject.add(new_rate_args)

      expect(new_rate).to be_kind_of(Rater::Rate)
      expect(new_rate.value).to eq(new_rate_args[:value])
    end
  end

  describe '#rating' do
    context 'there are no rates' do
      before do
        destroy_thing_rates
      end

      it 'returns 0' do
        expect(subject.rating).to eq(0)
      end
    end

    context 'there are rates' do
      it 'returns the average of all the rates' do
        rates.map(&:value).inject(0, &:+).to_f / rates.size
      end
    end
  end

  def destroy_thing_rates
    thing.send(:rates).destroy_all
  end
end