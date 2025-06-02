module SpreeOmnibus
  module Spree
    module VariantDecorator
      def omnibus_price(currency = cost_currency)
        price_in(currency).omnibus_price
      end

      def omnibus_price=(value)
        amount = BigDecimal(value.to_s)
        p = price_in(cost_currency)
        if p.new_record?
          p.omnibus_price = amount
          p.save!
        else
          p.update!(omnibus_price: amount)
        end
      end
    end
  end
end
::Spree::Variant.prepend SpreeOmnibus::Spree::VariantDecorator if ::Spree::Variant.included_modules.exclude?(SpreeOmnibus::Spree::VariantDecorator)
