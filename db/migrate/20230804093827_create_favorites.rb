class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :record_coffee_id, null: false
      t.integer :record_tea_leave_id, null: false
      t.timestamps
    end
  end
end
