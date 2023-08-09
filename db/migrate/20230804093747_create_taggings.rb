class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :record_coffee_id
      t.integer :record_tea_leafe_id
      t.timestamps
    end
   
  end
end
