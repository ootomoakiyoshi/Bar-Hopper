class CreateBarImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bar_images do |t|
      t.string :image_id
      t.integer :bar_id
      t.datetime "created_at", null: false
    　t.datetime "updated_at", null: falsera
    　t.timestamps
    end
  end
end
