class AddUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.references :user, index: true
      t.references :thing, index: true

      t.timestamps
    end
  end
end
