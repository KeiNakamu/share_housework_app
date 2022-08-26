FactoryBot.define do
  factory :user do
    name { "nakamura" }
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :second_user, class: User do
    name { "中村" }
    email { "second@example2.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
end