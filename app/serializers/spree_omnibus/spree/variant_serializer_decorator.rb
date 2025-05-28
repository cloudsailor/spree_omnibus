module SpreeOmnibus
  module Spree
    module VariantSerializerDecorator
      def self.prepended(base)
        base.attribute :omnibus_price do |variant, params|
          variant.omnibus_price(params[:currency])
        end
      end
    end
  end
end

if ::Spree::V2::Storefront::VariantSerializer.included_modules.exclude?(SpreeOmnibus::Spree::VariantSerializerDecorator)
  ::Spree::V2::Storefront::VariantSerializer.prepend SpreeOmnibus::Spree::VariantSerializerDecorator
end
