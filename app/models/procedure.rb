class Procedure < ApplicationRecord
  belongs_to :article
  mount_uploader :image, ImageUploader
  validates :content, presence: true
end
