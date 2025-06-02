class AddOmnibusPriceToSpreePrice < ActiveRecord::Migration[7.1]
  def up
    add_column :spree_prices, :omnibus_price, :decimal, precision: 10, scale: 2, default: 0.0
  end

  def down
    remove_column :spree_prices, :omnibus_price
  end
end
