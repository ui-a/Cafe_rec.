class CreateRecordCoffees < ActiveRecord::Migration[6.1]
  def change
    create_table :record_coffees do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :item_name, null: false
      t.string :brand_name, null: false
      t.integer :price, null: false
      t.text :review, null: false
      t.boolean :release, default: true, null: false
      t.float :total_star, null: false
      t.float :scent_star
      t.float :bitter_star
      t.float :acidity_star
      t.float :sweet_star
      t.float :rich_star
      t.timestamps
    end
  end
end
