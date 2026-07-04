class AddAddressToRestaurants < ActiveRecord::Migration[8.0]
  def change
    add_column :restaurants, :address, :string
  end
end
