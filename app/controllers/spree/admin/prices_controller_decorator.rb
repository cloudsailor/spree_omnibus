# frozen_string_literal: true

module Spree
  module Admin
    module PricesControllerDecorator
      def create
        super
        persist_omnibus_prices if params[:vp].present?
      end

      private

      def persist_omnibus_prices
        params[:vp].each do |variant_id, by_currency|
          variant = Spree::Variant.find(variant_id)
          next unless variant

          by_currency.each do |currency, attrs|
            value = attrs[:omnibus_price] || attrs["omnibus_price"]
            next if value.blank?

            price = variant.prices.find_or_initialize_by(currency: currency)
            price.omnibus_price = value
            price.save!
          end
        end
      end
    end
  end
end

Spree::Admin::PricesController.prepend Spree::Admin::PricesControllerDecorator if ::Spree::Admin::PricesController.included_modules.exclude?(Spree::Admin::PricesControllerDecorator)
