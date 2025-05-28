Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'add_omnibus_price_field_to_admin_product_form',
  insert_after: "div[data-hook='admin_product_form_cost_price']",
  text: <<-HTML
    <div data-hook="admin_product_form_omnibus_price" class="alpha two columns">
      <%= f.field_container :omnibus_price do %>
        <%= f.label :omnibus_price, I18n.t('omnibus_price') %>
        <%= f.text_field :omnibus_price,
              value: number_to_currency(@product.omnibus_price, unit: ''),
              class: 'form-control' %>
        <%= f.error_message_on :omnibus_price %>
      <% end %>
    </div>
  HTML
)
