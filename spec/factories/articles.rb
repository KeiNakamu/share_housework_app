
FactoryBot.define do
  factory :article do
    title { 'タイトル' }
    status { '公開' }
    association :user
  end

  factory :article_private, class: Article do
    title { '非公開タイトル' }
    status { '非公開' }
    date {Time.now}
    deadline{Time.now + 5.days}
    association :user
  end