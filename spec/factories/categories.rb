FactoryBot.define do

  factory :category do
    name { "カテゴリ１" }
  end

  factory :second_category, class: Category do
    name { "カテゴリ２" }
  end

  factory :third_category, class: Category do
    name { "カテゴリ３" }
  end
end