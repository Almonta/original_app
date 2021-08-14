# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do |n|
#   id = n + 5
#   name = Faker::Name.name
#   email = Faker::Internet.email
#   department = rand(1..5)
#   password = "password"
#   User.create!(id: id,
#                name: name,
#                department: department,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                admin: false)
# end

# 上記の方法はやめ、１つずつ設定する

User.create!(name: '佐藤 翔太',
             department: 0, # 未所属
             email: 'sample5@sample.com',
             password: 'sample55',
             password_confirmation: 'sample55',
             admin: false)

User.create!(name: '鈴木 美咲',
             department: 1, # 営業
             email: 'sample6@sample.com',
             password: 'sample66',
             password_confirmation: 'sample66',
             admin: false)

User.create!(name: '高橋 翔',
             department: 1,
             email: 'sample7@sample.com',
             password: 'sample77',
             password_confirmation: 'sample77',
             admin: false)

User.create!(name: '田中 葵',
             department: 2, # 技術
             email: 'sample8@sample.com',
             password: 'sample88',
             password_confirmation: 'sample88',
             admin: false)

User.create!(name: '伊藤 健太',
             department: 2,
             email: 'sample9@sample.com',
             password: 'sample99',
             password_confirmation: 'sample99',
             admin: false)

User.create!(name: '渡辺 陽菜',
             department: 3, # 計画
             email: 'sample10@sample.com',
             password: 'sample1010',
             password_confirmation: 'sample1010',
             admin: false)

User.create!(name: '山本 蓮',
             department: 3,
             email: 'sample11@sample.com',
             password: 'sample1111',
             password_confirmation: 'sample1111',
             admin: false)

User.create!(name: '中村 さくら',
             department: 4, # 製造
             email: 'sample12@sample.com',
             password: 'sample1212',
             password_confirmation: 'sample1212',
             admin: false)

User.create!(name: '小林 大輝',
             department: 4,
             email: 'sample13@sample.com',
             password: 'sample1313',
             password_confirmation: 'sample1313',
             admin: false)

User.create!(name: '加藤 愛',
             department: 5, # サービス
             email: 'sample14@sample.com',
             password: 'sample1414',
             password_confirmation: 'sample1414',
             admin: false)

user_ids = [ User.first.id, User.first.id + 2, User.first.id + 2, User.first.id + 3, User.first.id + 4,]

product = [
  "Model 1",
  "Model 3",
  "Model 5",
  "Model 7",
  "Model A",
  "Model B",
  "Model C",
  "Model X",
  "Model Y",
  "Model Z"
]

u = 0
n = 0
10.times do |n|
  5.times do |u|
    Product.create!(user_id: user_ids[u],
                    name: product[n])
  u += 1
  end
end

# 5.times do |n|
#   UserProduct.create!(user_id: 5,
#                       product_id: n + 1)
# end

# 10.times do |n|
#   Customer.create!(user_id: 5,
#                   number: "#{n+1}" * 4,
#                   name: "カンパニー#{n + 1}")
# end

# 5.times do |n|
#   UserCustomer.create!(user_id: 5,
#                       customer_id: n + 1)
# end

# 2.times do |n|
#   content = 'アップ資料は参考です。スクールで学習したRubyのまとめ資料です。'
#   ProductDocument.create!(user_id: 8,
#                           product_id: n + 1,
#                           name: '取説',
#                           content: content,
#                           document: File.open("./db/documents/'21.07.07_チェリー本_7.2-7.3_クラスの定義.pdf"),
#                           public_level: 0)
# end

# 3.times do |n|
#   content = 'アップ資料は参考です。スクールで学習したRubyのまとめ資料です。'
#   ProductDocument.create!(user_id: 9,
#                           product_id: n + 3,
#                           name: '解析結果',
#                           content: content,
#                           document: File.open("./db/documents/'21.07.07_チェリー本_7.4-7.6_クラスの継承.pdf"),
#                           public_level: 1)
# end

# 2.times do |n|
#   content = 'アップ資料は参考です。スクールで学習したRubyのまとめ資料です。'
#   CustomerDocument.create!(user_id: 6,
#                            customer_id: n + 1,
#                            name: '注文書',
#                            content: content,
#                            document: File.open("./db/documents/'21.07.12_チェリー本_8.6-8.8_モジュールの利用法.pdf"),
#                            public_level: 0)
# end

# 3.times do |n|
#   content = 'アップ資料は参考です。スクールで学習したRubyのまとめ資料です。'
#   CustomerDocument.create!(user_id: 9,
#                            customer_id: n + 3,
#                            name: '組立手順書',
#                            content: content,
#                            document: File.open("./db/documents/'21.07.12_チェリー本_8.1-8.5_モジュールとは.pdf"),
#                            public_level: 1)
# end

# 5.times do |n|
#   ProductContact.create!(user_id: n + 5,
#                          product_id: 1,
#                          contact_message: "メッセージ#{n+1}")
# end

# 5.times do |n|
#   CustomerContact.create!(user_id: n + 5,
#                           customer_id: 1,
#                           contact_message: "メッセージ#{n+1}")
# end

# 5.times do |n|
#   Schedule.create!(customer_id: 1,
#                    serial_number: "123#{n+1}",
#                    line_on: "2021-05-0#{n+1}",
#                    completed_on: "2021-05-0#{n+2}",
#                    shipmented_on: "2021-05-0#{n+3}",
#                    deliveried_on: "2021-05-0#{n+4}")
# end