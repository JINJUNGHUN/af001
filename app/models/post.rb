class Post < ApplicationRecord

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :image, file_size: { less_than: 10.megabytes }

end
