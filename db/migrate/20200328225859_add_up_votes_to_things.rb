class AddUpVotesToThings < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :up_votes, :integer, default: 0
  end
end
