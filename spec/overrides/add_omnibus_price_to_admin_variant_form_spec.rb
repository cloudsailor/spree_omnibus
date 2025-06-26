require 'rails_helper'

RSpec.describe 'spree/admin/variants/_form omnibus_price override', type: :feature do
  context 'with admin user' do
    stub_authorization!

    context 'when visiting the edit variant form' do
      let!(:product) { create(:product) }
      let!(:variant) { create(:variant, product: product) }

      before do
        visit spree.edit_admin_product_variant_path(product, variant)
      end

      it 'displays the omnibus_price field under cost price' do
        expect(page).to have_selector('label', text: I18n.t('omnibus_price'))
        expect(page).to have_field("variant[omnibus_price]")
      end
    end
  end
end
