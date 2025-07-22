require 'rails_helper'

RSpec.describe SpreeOmnibus::Spree::PriceDecorator, type: :model do
  subject { build(:price, omnibus_price: omnibus_price) }

  describe 'omnibus_price validation' do
    context 'when omnibus_price is nil' do
      let(:omnibus_price) { nil }

      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'when omnibus_price is within allowed range' do
      let(:omnibus_price) { 999_999_999_999 }

      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'when omnibus_price is negative' do
      let(:omnibus_price) { -1 }

      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:omnibus_price]).to include('must be greater than or equal to 0')
      end
    end

    context 'when omnibus_price exceeds maximum' do
      let(:omnibus_price) { 1_000_000_000_000 }

      it 'is invalid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:omnibus_price]).to include('must be less than or equal to 999999999999')
      end
    end
  end
end
