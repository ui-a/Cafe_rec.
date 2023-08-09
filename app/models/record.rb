class Record < ApplicationRecord
  
  has_one_attached :image

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :item_name, presence:true
  validates :brand_name, presence:true
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :review, presence:true, length: { minimum: 10, maximum: 500}

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delote Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end
  
end
