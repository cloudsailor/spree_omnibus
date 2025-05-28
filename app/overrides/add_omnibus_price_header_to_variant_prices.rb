Deface::Override.new(
  virtual_path: 'spree/admin/prices/_variant_prices',
  name: 'add_omnibus_price_header_to_variant_prices',
  insert_after: "tr[data-hook='variant_prices_header'] th:last-child",
  text: <<-HTML
    <th scope="col" class="text-center" style="min-width: 150px;">
      <%= I18n.t('omnibus_price') %>
    </th>
  HTML
)
