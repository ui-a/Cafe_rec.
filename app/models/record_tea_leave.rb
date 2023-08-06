class RecordTeaLeave < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

end
