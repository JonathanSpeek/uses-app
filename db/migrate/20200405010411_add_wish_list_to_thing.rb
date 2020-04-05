class AddWishListToThing < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :whish_list, :boolean, default: false
  end
end
