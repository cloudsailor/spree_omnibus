Rails.application.config.to_prepare do
  Spree::PermittedAttributes.product_attributes << :omnibus_price
  Spree::PermittedAttributes.variant_attributes << :omnibus_price
end