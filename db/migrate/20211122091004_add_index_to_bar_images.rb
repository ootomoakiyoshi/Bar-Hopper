class AddIndexToBarImages < ActiveRecord::Migration[5.2]
  def change
    add_index :bar_images, :bar_id
  end
end
