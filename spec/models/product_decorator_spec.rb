require 'rails_helper'

RSpec.describe SpreeOmnibus::Spree::ProductDecorator, type: :model do
  describe 'omnibus_price' do
    let(:product) { create(:product) }
    let!(:price) { create(:price, variant: product.master, currency: 'EUR', omnibus_price: 3.0) }

    it 'returns omnibus price for master variant in given currency' do
      expect(product.omnibus_price('EUR')).to eq(3.0)
    end

    it 'returns omnibus price for master variant with default currency' do
      expect(product.omnibus_price).to eq(0.0)
    end
  end
end