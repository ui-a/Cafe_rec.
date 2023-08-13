class Tag < ApplicationRecord

  has_many :taggings, dependent: :destroy
  has_many :record_coffees, through: :taggings
  has_many :record_tea_leaves, through: :taggings

  validates :name, uniqueness: true, presence:true, length:{maximum:20}

end
