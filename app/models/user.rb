class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
end
