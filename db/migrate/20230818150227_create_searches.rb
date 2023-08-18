class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.integer :record_coffee_id
      t.integer :record_tea_leafe_id

      t.timestamps
    end
  end
end
