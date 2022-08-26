
FactoryBot.define do
  factory :article do
    title { 'タイトル' }
    status { 'public' }
    association :user
  end

  factory :article_private, class: Article do
    title { '非公開タイトル' }
    status { 'private' }
    date {Time.now}
    deadline{Time.now + 5.days}
    association :user
  end
end