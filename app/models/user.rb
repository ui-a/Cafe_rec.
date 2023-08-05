class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :record_coffees, dependent: :destroy
  has_many :record_tea_leaves, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_record_coffees, through: :favorites, source: :record_coffee
  has_many :favorited_record_tea_leaves, through: :favorites, source: :record_tea_leave
  
  validates :name, presence: true
  
end
