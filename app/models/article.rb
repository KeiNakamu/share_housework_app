class Article < ApplicationRecord
  belongs_to :user
  has_many :procedures, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :procedures, allow_destroy: true, reject_if: :all_blank
end
