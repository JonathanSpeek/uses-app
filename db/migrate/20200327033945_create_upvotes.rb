class CreateUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.string :user_id
      t.string :thing_id

      t.timestamps
    end
  end
end
