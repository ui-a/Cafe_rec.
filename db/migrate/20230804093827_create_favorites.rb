class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :record_coffee_id
      t.integer :record_tea_leafe_id
      t.timestamps
    end
  end
end
