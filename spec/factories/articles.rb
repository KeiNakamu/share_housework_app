
FactoryBot.define do
  factory :article do
    title { 'タイトル' }
    association :user
  end

  factory :second_article, class: Article do
    title { 'second_title' }
    association :user
  end

  factory :third_article, class: Article do
    title { '3rd_title' }
    association :second_user
  end

  factory :article_private, class: Article do
    title { '非公開タイトル' }
    status { 'private' }
    date {Time.now}
    deadline{Time.now + 5.days}
    association :user
  end
end