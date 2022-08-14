class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
  has_many :favorites, dependent: :destroy

  def liked_by?(article_id)
    likes.where(article_id: article_id).exists?
  end
end
