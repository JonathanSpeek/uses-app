class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things do |t|
      t.string :text
      t.string :link

      t.timestamps
    end
  end
end
