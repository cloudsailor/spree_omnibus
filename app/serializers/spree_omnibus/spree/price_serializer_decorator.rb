module SpreeOmnibus
  module Spree
    module PriceSerializerDecorator
      def self.prepended(base)
        base.attribute :omnibus_price
      end
    end
  end
end

if ::Spree::Api::V2::Platform::PriceSerializer.included_modules.exclude?(SpreeOmnibus::Spree::PriceSerializerDecorator)
  ::Spree::Api::V2::Platform::PriceSerializer.prepend SpreeOmnibus::Spree::PriceSerializerDecorator
end
