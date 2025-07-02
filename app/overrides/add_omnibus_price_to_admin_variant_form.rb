class AddOmnibusPriceToAdminVariantForm
  Deface::Override.new(
    virtual_path: 'spree/admin/variants/_form',
    name: 'add_omnibus_price_field_to_admin_variant_form',
    insert_after: "div[data-hook='cost_price']",
    text: <<-HTML
    <div class="form-group" data-hook="omnibus_price">
    <%= f.label :omnibus_price, I18n.t('omnibus_price') %>
            <%= f.text_field :omnibus_price, value: number_to_currency(@variant.omnibus_price, unit: ''), class: 'form-control' %>
    </div>
  HTML
  )
end