require 'rails_helper'

RSpec.describe 'spree/admin/prices/variant_prices override', type: :feature do
  context 'with admin user' do
    stub_authorization!

    context 'when visiting the product prices page' do
      let!(:product) { create(:product) }

      before do
        Rails.application.reload_routes!
        visit spree.admin_product_prices_path(product)
      end

      it 'displays the omnibus_price text field for each variant/currency cell' do
        expect(page).to have_selector("input[name='vp[#{product.master.id}][USD][omnibus_price]']")
      end
    end
  end
end