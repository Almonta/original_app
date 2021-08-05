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

User.create!(id: 5,
             name: '佐藤 翔太',
             department: 0,# 未所属
             email: 'sample5@sample.com',
             password: 'sample55',
             password_confirmation: 'sample55',
             admin: false)

User.create!(id: 6,
             name: '鈴木 美咲',
             department: 1,# 営業
             email: 'sample6@sample.com',
             password: 'sample66',
             password_confirmation: 'sample66',
             admin: false)

User.create!(id: 7,
             name: '高橋 翔',
             department: 1,
             email: 'sample7@sample.com',
             password: 'sample77',
             password_confirmation: 'sample77',
             admin: false)

User.create!(id: 8,
             name: '田中 葵',
             department: 2,# 技術
             email: 'sample8@sample.com',
             password: 'sample88',
             password_confirmation: 'sample88',
             admin: false)

User.create!(id: 9,
             name: '伊藤 健太',
             department: 2,
             email: 'sample9@sample.com',
             password: 'sample99',
             password_confirmation: 'sample99',
             admin: false)

User.create!(id: 10,
             name: '渡辺 陽菜',
             department: 3,# 計画
             email: 'sample10@sample.com',
             password: 'sample1010',
             password_confirmation: 'sample1010',
             admin: false)

User.create!(id: 11,
             name: '山本 蓮',
             department: 3,
             email: 'sample11@sample.com',
             password: 'sample1111',
             password_confirmation: 'sample1111',
             admin: false)

User.create!(id: 12,
             name: '中村 さくら',
             department: 4,# 製造
             email: 'sample12@sample.com',
             password: 'sample1212',
             password_confirmation: 'sample1212',
             admin: false)

User.create!(id: 13,
             name: '小林 大輝',
             department: 4,
             email: 'sample13@sample.com',
             password: 'sample1313',
             password_confirmation: 'sample1313',
             admin: false)

User.create!(id: 14,
             name: '加藤 愛',
             department: 5,# サービス
             email: 'sample14@sample.com',
             password: 'sample1414',
             password_confirmation: 'sample1414',
             admin: false)

