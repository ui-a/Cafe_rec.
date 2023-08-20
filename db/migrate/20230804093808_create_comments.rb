class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :record_drinkable_type
      t.integer :record_drinkable_id
      t.text :comment
      t.timestamps
    end

    add_index :comments, [:record_drinkable_type, :record_drinkable_id]
  end
end
