class AddPreferencesToPrice < ActiveRecord::Migration[7.2]
  def up
    add_column :spree_prices, :preferences, :text
  end

  def down
    remove_column :spree_prices, :preferences
  end
end
