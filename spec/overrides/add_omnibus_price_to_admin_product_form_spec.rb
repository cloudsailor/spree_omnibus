require 'rails_helper'

RSpec.describe 'spree/admin/products/_form omnibus_price override', type: :feature do
  context 'with admin user' do
    stub_authorization!

    context 'when visiting the edit product form' do
      let!(:product) { create(:product) }

      before do
        visit spree.edit_admin_product_path(product)
      end

      it 'displays the omnibus_price field under cost price' do
        expect(page).to have_selector('label', text: I18n.t('omnibus_price'))
        expect(page).to have_field('product[omnibus_price]')
      end
    end
  end
end
