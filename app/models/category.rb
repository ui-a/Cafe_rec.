class Category < ApplicationRecord
  
  has_many :record_coffees, dependent: :destroy
  has_many :record_tea_leaves, dependent: :destroy

  validates :name, presence:true, uniqueness: true
  
end
