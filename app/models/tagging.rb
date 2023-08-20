class Tagging < ApplicationRecord
  
  belongs_to :tag
  belongs_to :record_drinkable, polymorphic: true
end
