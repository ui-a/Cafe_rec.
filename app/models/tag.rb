class Tag < ApplicationRecord

  has_many :taggings, dependent: :destroy
  has_many :record_coffees, through: :taggings, source: :record_drinkable, source_type: 'RecordCoffee'
  has_many :record_tea_leaves, through: :taggings, source: :record_drinkable, source_type: 'RecordTeaLeafe'

  validates :name, uniqueness: true, presence:true, length:{maximum:20}

end
