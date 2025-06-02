require 'rails_helper'

RSpec.describe SpreeOmnibus::Spree::VariantSerializerDecorator, type: :serializer do
  let(:serializer_klass) { Spree::V2::Storefront::VariantSerializer }
  let(:variant)         { build(:variant) }
  let(:params)          { { currency: 'EUR' } }
  let(:price)           { BigDecimal('42.42') }

  before do
    serializer_klass.prepend described_class
    allow(variant).to receive(:omnibus_price).with('EUR').and_return(price)
  end

  subject(:serialized) do
    serializer_klass.new(variant, params: params).serializable_hash
  end

  it 'adds :omnibus_price and returns it properly' do
    attrs = serialized.dig(:data, :attributes)
    expect(attrs).to include(omnibus_price: price)
  end
end
