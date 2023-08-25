class RecordCoffee < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :comments, dependent: :destroy, as: :record_drinkable
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :taggings, dependent: :destroy, as: :record_drinkable
  has_many :tags, through: :taggings

  validates :item_name, presence:true
  validates :shop_name, presence:true
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :review, presence:true, length: { minimum: 10, maximum: 500}

  scope :latest, -> {order(created_at: :desc)}
  scope :total_star_count, -> {order(total_star: :desc)}
  scope :released, -> {where(release: true)}
  scope :unreleased, -> {where(release: false)}

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  #tag作成・更新
  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end


end
