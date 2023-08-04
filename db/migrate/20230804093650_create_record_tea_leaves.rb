class CreateRecordTeaLeaves < ActiveRecord::Migration[6.1]
  def change
    create_table :record_tea_leaves do |t|
      t.integer :user_id, null: false
      t.string :item_name, null: false
      t.string :brand_name, null: false
      t.integer :price, null: false
      t.text :review, null: false
      t.float :total_star, null: false
      t.float :scent_star, null: false
      t.float :bitter_star, null: false
      t.float :fresh_star, null: false
      t.float :easy_star, null: false
      t.boolean :release, null: false, default: true
      t.timestamps
    end
  end
end
