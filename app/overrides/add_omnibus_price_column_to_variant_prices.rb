class AddOmnibusPriceColumnToVariantPrices < Spree::Base
  Deface::Override.new(
    virtual_path: 'spree/admin/prices/_variant_prices',
    name: 'add_omnibus_price_column_to_variant_prices',
    insert_after: "tr#variant_prices_row[data-hook='variant_prices_row'] td:last-child",
    text: <<-HTML
    <td>
      <%= text_field_tag "vp[\#{variant.id}][\#{code}][omnibus_price]",
            (price && price.price ? price.omnibus_price : ''),
            class: 'form-control' %>
    </td>
  HTML
  )
end