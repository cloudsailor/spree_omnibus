require 'rails_helper'

RSpec.describe 'spree/admin/prices/variant_prices header override', type: :feature do
  context 'with admin user' do
    stub_authorization!

    context 'when visiting the product prices page' do
      let!(:product) { create(:product) }


      before do
        # Reload routes/overrides to ensure Deface is applied
        Rails.application.reload_routes!
        visit spree.admin_product_prices_path(product)
      end

      it 'displays the omnibus_price header column' do
        expect(page).to have_selector('th.text-center', text: I18n.t('omnibus_price'))
      end
    end
  end
end
