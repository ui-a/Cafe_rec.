class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :record_drinkable, polymorphic: true

  validates :comment, presence:true
end
