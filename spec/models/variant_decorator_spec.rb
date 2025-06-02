require 'rails_helper'

RSpec.describe SpreeOmnibus::Spree::VariantDecorator, type: :model do
  describe '#omnibus_price' do
    let(:product) { create(:product) }
    let!(:variant) { create(:variant, product:) }
    let!(:price) { create(:price, variant:, currency: 'EUR', omnibus_price: 3.0) }

    it 'returns omnibus price for variant in given currency' do
      expect(variant.omnibus_price('EUR')).to eq(3.0)
    end

    it 'returns omnibus price for variant with default currency' do
      expect(variant.omnibus_price).to eq(0.0)
    end
  end

  describe '#omnibus_price=' do
    subject { variant.omnibus_price = value }

    let(:variant)   { create(:variant) }
    let(:currency)  { 'USD' }
    let(:value)     { '123.45' }
    let(:amount)    { BigDecimal(value) }

    before do
      allow(variant).to receive(:cost_currency).and_return(currency)
    end

    context 'when price_in returns new record' do
      let(:new_price) { build(:price, variant: variant, currency: currency) }

      before do
        allow(variant).to receive(:price_in)
                            .with(currency)
                            .and_return(new_price)
      end

      it 'sets omnibus_price and saves the object by save!' do
        expect(new_price).to receive(:omnibus_price=).with(amount)
        expect(new_price).to receive(:save!)

        subject
      end
    end

    context 'when price_in returns existing record' do
      let!(:existing_price) { create(:price, variant: variant, currency: currency) }

      before do
        allow(variant).to receive(:price_in)
                            .with(currency)
                            .and_return(existing_price)
      end

      it 'calls update! with :omnibus_price' do
        expect(existing_price).to receive(:update!).with(omnibus_price: amount)

        subject
      end
    end
  end
end