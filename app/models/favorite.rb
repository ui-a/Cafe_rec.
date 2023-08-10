class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :record_coffee, optional: true
  belongs_to :record_tea_leafe, optional: true
  
end
