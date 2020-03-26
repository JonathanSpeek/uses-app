class AddUserIdToThing < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :user_id, :integer
  end
end
