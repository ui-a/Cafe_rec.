class Tagging < ApplicationRecord
  
  belongs_to :tag
  belongs_to :record_coffee, optional: true
  belongs_to :record_tea_leafe, optional: true
end
