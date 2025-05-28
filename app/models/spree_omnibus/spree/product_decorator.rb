module SpreeOmnibus
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.class_eval do
          delegate :omnibus_price, :omnibus_price=, to: :find_or_build_master
        end
      end
    end
  end
end
::Spree::Product.prepend SpreeOmnibus::Spree::ProductDecorator if ::Spree::Product.included_modules.exclude?(SpreeOmnibus::Spree::ProductDecorator)
