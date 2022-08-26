class Article < ApplicationRecord
  belongs_to :user
  has_many :procedures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories, source: :category
  
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :procedures, allow_destroy: true, reject_if: :all_blank

  enum status: { public: 0, private: 1 }, _prefix: true
  validates_associated :procedures

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.article_id) FROM likes where likes.article_id = articles.id GROUP BY likes.article_id)'
    Arel.sql(query)
  end

  validates :title, presence: true
  validates :status, presence: true
  validates :procedures, associated: true
end
