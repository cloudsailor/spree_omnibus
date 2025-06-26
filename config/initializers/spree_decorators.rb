Rails.application.config.to_prepare do
  Spree::V2::Storefront::VariantSerializer.
    prepend SpreeOmnibus::Spree::VariantSerializerDecorator

  Spree::Variant.prepend SpreeOmnibus::Spree::VariantDecorator
  Spree::Admin::PricesController.prepend Spree::Admin::PricesControllerDecorator
end
