class Tag < ApplicationRecord
  
  has_many :taggings, dependent: :destroy
  has_many :records, through: :taggings
  
  validates :name, presence:true, length:{maximum:20}
  
end
