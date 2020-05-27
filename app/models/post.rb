class Post < ApplicationRecord
  # require 'carrierwave/orm/activerecord'

  belongs_to :user, optional: true
  has_many :comments, dependent: :nullify
  has_and_belongs_to_many :hashtags
  accepts_nested_attributes_for :hashtags

  mount_uploader :image_url, ImageUploader
end
