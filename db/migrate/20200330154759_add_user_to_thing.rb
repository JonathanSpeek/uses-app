class AddUserToThing < ActiveRecord::Migration[6.0]
  def change
    add_reference :things, :user, index: true
    add_column :things, :num_up_votes, :integer, default: 0
  end
end
