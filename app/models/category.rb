class Category < ApplicationRecord
  has_many :articlecategories, dependent: :destroy
  has_many :articles, through: :categories
end
