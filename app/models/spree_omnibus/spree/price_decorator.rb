module SpreeOmnibus
  module Spree
    module PriceDecorator
      def self.prepended(base)
        base.preference :omnibus_discount_percent, :integer
        base.before_save :calculate_omnibus_discount_percent
        base.validates :omnibus_price, allow_nil: true, numericality: {
          greater_than_or_equal_to: 0,
          less_than_or_equal_to: 999_999_999_999
        }
      end

      def calculate_omnibus_discount_percent
        return if [omnibus_price, amount].any?(&:blank?) || omnibus_price.to_f.zero?

        self.preferred_omnibus_discount_percent = ((omnibus_price - amount) / omnibus_price.to_f * 100).floor
      end
    end
  end
end

Spree::Price.prepend SpreeOmnibus::Spree::PriceDecorator if Spree::Price.included_modules.exclude?(SpreeOmnibus::Spree::PriceDecorator)
