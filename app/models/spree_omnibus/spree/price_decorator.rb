module SpreeOmnibus
  module Spree
    module PriceDecorator
      def self.prepended(base)
        base.validates :omnibus_price, allow_nil: true, numericality: {
          greater_than_or_equal_to: 0,
          less_than_or_equal_to: 999_999_999_999
        }
      end
    end
  end
end

Spree::Price.prepend SpreeOmnibus::Spree::PriceDecorator if Spree::Price.included_modules.exclude?(SpreeOmnibus::Spree::PriceDecorator)
