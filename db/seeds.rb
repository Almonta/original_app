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


user_ids = [
  User.first.id, 
  User.first.id + 1, 
  User.first.id + 2, 
  User.first.id + 3, 
  User.first.id + 4,
  User.first.id + 5,
  User.first.id + 6,
  User.first.id + 7,
  User.first.id + 8,
  User.first.id + 9,
  User.first.id + 10
]

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


n = 0
5.times do |u|
  Product.create!(user_id: user_ids[u],
                  name: product[n])
n += 1
end

n = 5
5.times do |u|
  Product.create!(user_id: user_ids[u],
                  name: product[n])
n += 1
end

Customer.create!(user_id: user_ids[0],
                 number: "123-456",
                 name: "TSMC")

Customer.create!(user_id: user_ids[1],
                 number: "234-567",
                 name: "サムスン")

Customer.create!(user_id: user_ids[2],
                 number: "345-600",
                 name: "エヌビディア")

Customer.create!(user_id: user_ids[3],
                 number: "345-700",
                 name: "インテル")

Customer.create!(user_id: user_ids[4],
                 number: "345-800",
                 name: "ブロードコム")

Customer.create!(user_id: user_ids[5],
                 number: "345-900",
                 name: "クアルコム")

Customer.create!(user_id: user_ids[6],
                 number: "456-100",
                 name: "ソニー")

Customer.create!(user_id: user_ids[7],
                 number: "456-200",
                 name: "ルネサスエレクトロニクス")

Customer.create!(user_id: user_ids[8],
                 number: "456-300",
                 name: "キオクシアホールディングス")

Customer.create!(user_id: user_ids[9],
                 number: "456-400",
                 name: "マイクロンテクノロジー")


# Userから全てのuser_idを配列で取り出す。
first_user = User.first.id
last_user = User.first.id + 9
user_id_all = (first_user..last_user).to_a
# Userから奇数のuser_idのみを配列で取り出す。
odd_user_id  = user_id_all.select(&:odd?)
# Userから偶数のuser_idのみを配列で取り出す。
even_user_id = user_id_all.select(&:even?)


first_product = Product.first.id
last_product = Product.first.id + 9
product_id_all = (first_product..last_product).to_a
odd_product_id = product_id_all.select(&:odd?)
even_product_id = product_id_all.select(&:even?)


first_customer = Customer.first.id
last_customer = Customer.first.id + 9
customer_id_all = (first_customer..last_customer).to_a
odd_customer_id = customer_id_all.select(&:odd?)
even_customer_id = customer_id_all.select(&:even?)


5.times do |m|
  4.times do |n|
    UserProduct.create!(user_id: odd_user_id[m],
                        product_id: odd_product_id[n])
  end
end

5.times do |m|
  4.times do |n|
    UserProduct.create!(user_id: even_user_id[m],
                        product_id: even_product_id[n])
  end
end

5.times do |m|
  4.times do |n|
    UserCustomer.create!(user_id: odd_user_id[m],
                         customer_id: odd_customer_id[n])
  end
end

5.times do |m|
  4.times do |n|
    UserCustomer.create!(user_id: even_user_id[m],
                         customer_id: even_customer_id[n])
  end
end

# binding.irb


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