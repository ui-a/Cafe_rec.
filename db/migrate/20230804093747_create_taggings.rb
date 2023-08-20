class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.string "record_drinkable_type"
      t.integer "record_drinkable_id"
      t.timestamps
    end
   
   add_index :taggings, [:record_drinkable_type, :record_drinkable_id]
  end
end
