class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :record_coffee
  belongs_to :record_tea_leafe
  
end
