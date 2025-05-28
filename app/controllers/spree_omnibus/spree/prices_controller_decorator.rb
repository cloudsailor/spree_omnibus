module Spree
  module PricesControllerDecorator
    def create
      super
      persist_omnibus_prices if params[:vp].present?
    end

    private

    def persist_omnibus_prices
      params[:vp].each do |variant_id, by_currency|
        variant = Spree::Variant.find(variant_id)
        by_currency.each do |currency, attrs|
          next unless attrs[:omnibus_price].present?

          price = variant.prices.find_or_initialize_by(currency: currency)
          price.omnibus_price = attrs[:omnibus_price]
          price.save!
        end
      end
    end
  end
end

Spree::Admin::PricesController.prepend Spree::PricesControllerDecorator
