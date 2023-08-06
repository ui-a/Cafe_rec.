class RecordCoffee < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  validates :item_name, presence:true
  validates :brand_name, presence:true
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :review, presence:true, length: { minimum: 10, maximum: 500}


end
