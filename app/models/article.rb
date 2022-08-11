class Article < ApplicationRecord
  has_many :procedures, dependent: :destroy

  accepts_nested_attributes_for :procedures, allow_destroy: true, reject_if: :all_blank
end
