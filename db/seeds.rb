# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
admin_user = User.create(name: "中村", email: "test@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile1.png"), profile: "当アプリの主です。\r\nこのアプリを盛り上げていくぞ〜!", admin: true)

User.create([
  { name: "青野", email: "test2@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile2.png"), profile: "こんにちは、よろしく"},
  { name: "遠藤", email: "test3@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile3.png"), profile: "こんにちは、よろしく"},
  { name: "門脇", email: "test4@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile4.png"), profile: "こんにちは、よろしく"},
  { name: "金子", email: "test5@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile5.png"), profile: "こんにちは、よろしく"},
  { name: "齋藤", email: "test6@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile6.png"), profile: "こんにちは、よろしく"},
  { name: "佐藤", email: "test7@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile7.png"), profile: "こんにちは、よろしく"},
  { name: "鈴木", email: "test8@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile8.png"), profile: "こんにちは、よろしく"},
  { name: "西川", email: "test9@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile9.png"), profile: "こんにちは、よろしく"},
  { name: "丸岡", email: "test10@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile10.png"), profile: "こんにちは、よろしく"},
  { name: "森塚", email: "test11@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile11.png"), profile: "こんにちは、よろしく"},
  { name: "山田", email: "test12@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile12.png"), profile: "こんにちは、よろしく"},
  { name: "吉田", email: "test13@email.com", password: "1234567", image: File.open("./app/assets/images/profile_images/profile13.png"), profile: "こんにちは、よろしく"}
])
User.guest
User.admin_guest

# Category
Category.create!([
  { name: "掃除" },
  { name: "収納" },
  { name: "洗濯" },
  { name: "キッチン" },
  { name: "お役立ち" },
  { name: "家事の裏技" },
  { name: "100円" },
  { name: "節約" },
  { name: "How To" },
  { name: "グッズ" },
  { name: "その他" }
])

# Article
Article.create!([
  { title: "(sample)電気圧力鍋",
    image: File.open("./app/assets/images/article_images/article_images7.png"),
    status: 0,
    category_ids: [4, 5, 10],
    user_id: rand(1..13),
    procedures_attributes: [
      { image: File.open("./app/assets/images/article_images/article_images7.png"),
        content: "煮込みはもちろん、蒸し料理や無水調理などの手の込んだ料理を簡単に作ることができます。\r\n料理をする時間や手間を削減できます。"
      }
    ]
  },
  { title: "(sample)洗濯",
    image: File.open("./app/assets/images/article_images/article_images3.png"),
    status: 0,
    category_ids: [3, 9],
    user_id: rand(1..13),
    procedures_attributes: [
      { image: File.open("./app/assets/images/article_images/article_images3.png"),
        content: "洗濯機に洗濯するものを入れます"
      },
      { image: File.open("./app/assets/images/article_images/article_images2.png"),
        content: "洗剤を入れます"
      },
      { image: File.open("./app/assets/images/article_images/article_images4.png"),
        content: "漂白剤を入れます"
      },
      { image: File.open("./app/assets/images/article_images/article_images5.png"),
        content: "柔軟剤を入れます"
      },
      { image: File.open("./app/assets/images/article_images/article_images6.png"),
        content: "スイッチを入れます"
      },
      { image: File.open("./app/assets/images/article_images/article_images1.png"),
        content: "洗濯が終わったら、洗濯物を干します"
      }
    ]
  },
  { title: "(sample)水回りのものは浮かすのがおすすめ",
    image: File.open("./app/assets/images/article_images/article_images10.png"),
    status: 0,
    category_ids: [1, 2, 4],
    user_id: rand(1..13),
    procedures_attributes: [
      { image: File.open("./app/assets/images/article_images/article_images10.png"),
        content: "お風呂場やキッチンにあるシャンプーや洗剤のボトル類は浮かせて収納することで、ボトルの底のヌルヌル汚れを防げます。\r\nそうすることで掃除が楽になります。"
      }
    ]
  },
  { title: "(sample)『なるべく床の上に物を置かない』が掃除の時短",
    image: File.open("./app/assets/images/article_images/article_images8.jpg"),
    status: 0,
    category_ids: [1],
    user_id: rand(1..13),
    procedures_attributes: [
      { image: File.open("./app/assets/images/article_images/article_images8.jpg"),
        content: "掃除機をかけたり、モップをかけたりする時に、床に物があるだけで掃除に時間がかかります。\r\nなるべく物を床に置かないようにしよう。"
      }
    ]
  },
  { title: "(sample)オキシクリーンでオキシ漬け",
    image: File.open("./app/assets/images/article_images/article_images9.png"),
    status: 0,
    category_ids: [1, 5, 6, 10],
    user_id: rand(1..13),
    procedures_attributes: [
      { image: File.open("./app/assets/images/article_images/article_images9.png"),
        content: "オキシクリーンを使って、洗濯槽の掃除がおすすめ"
      }
    ]
  }
])

# like
5.times do |n|
  User.all.ids.each do |user_id|
    Like.create(user_id: user_id, article_id: rand(1..5))
  end
end

# favorite
5.times do |n|
  User.all.ids.each do |user_id|
    Favorite.create(user_id: user_id, article_id: rand(1..5))
  end
end

# comment
5.times do |n|
  User.all.each do |user|
    Comment.create(user_id: user.id, article_id: rand(1..5), content: "コメント")
  end
end

# follow
User.all.ids.each do |followed_id|
  if followed_id == 13
    follower_id = "12"
  else
    follower_id = "13"
  end
  Relationship.create(followed_id: followed_id, follower_id: follower_id)
end

User.all.ids.each do |followed_id|
  if followed_id == 12
    follower_id = "11"
  else
    follower_id = "12"
  end
  Relationship.create(followed_id: followed_id, follower_id: follower_id)
end

User.all.ids.each do |followed_id|
  if followed_id == 11
    follower_id = "10"
  else
    follower_id = "11"
  end
  Relationship.create(followed_id: followed_id, follower_id: follower_id)
end

User.all.ids.each do |followed_id|
  if followed_id == 10
    follower_id = "9"
  else
    follower_id = "10"
  end
  Relationship.create(followed_id: followed_id, follower_id: follower_id)
end

User.all.ids.each do |followed_id|
  if followed_id == 9
    follower_id = "8"
  else
    follower_id = "9"
  end
  Relationship.create(followed_id: followed_id, follower_id: follower_id)
end