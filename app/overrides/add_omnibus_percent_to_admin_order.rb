class AddOmnibusPercentToAdminOrder
  Deface::Override.new(
    virtual_path: 'spree/admin/orders/_line_items',
    name: 'add_omnibus_percent_to_admin_order_header',
    insert_after: "tr th:nth-child(3)",
    text: <<-HTML
    <th class="text-center"><%= I18n.t(:omnibus_discount_percent) %></th>
  HTML
  )

  Deface::Override.new(
    virtual_path: 'spree/admin/orders/_line_items',
    name: 'add_omnibus_percent_to_admin_order_body',
    insert_after: "tr td:nth-child(4)",
    text: <<-HTML
      <td class="text-center">
        <% if item.variant&.public_metadata['omnibus_discount_percent'].present? %>
          <%= "\#{item.variant.public_metadata['omnibus_discount_percent']}%" %>
        <% end %>
      </td>
  HTML
  )
end
