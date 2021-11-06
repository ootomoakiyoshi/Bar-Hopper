class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.text :bar_name
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
