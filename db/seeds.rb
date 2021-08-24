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

User.create!(name: '管理者',
             department: 0,
             email: 'sample15@sample.com',
             password: 'sample1515',
             password_confirmation: 'sample1515',
             admin: true)

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
5.times do |m|
  Product.create!(user_id: user_ids[m],
                  name: product[n])
n += 1
end

n = 5
5.times do |m|
  Product.create!(user_id: user_ids[m],
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


5.times do |o|
  5.times do |l|
    UserProduct.create!(user_id: odd_user_id[o],
                        product_id: odd_product_id[l])
  end
end

5.times do |o|
  5.times do |l|
    UserProduct.create!(user_id: even_user_id[o],
                        product_id: even_product_id[l])
  end
end

5.times do |k|
  5.times do |q|
    UserCustomer.create!(user_id: odd_user_id[k],
                         customer_id: odd_customer_id[q])
  end
end

5.times do |k|
  5.times do |q|
    UserCustomer.create!(user_id: even_user_id[k],
                         customer_id: even_customer_id[q])
  end
end

# binding.irb

sales_user = User.find_by(department: 1).id
engineering_user = User.find_by(department: 2).id
planning_user = User.find_by(department: 3).id
manufacturing_user = User.find_by(department: 4).id
service_user = User.find_by(department: 5).id

sales_users = User.where(department: 1).ids
engineering_users = User.where(department: 2).ids
planning_users = User.where(department: 3).ids
manufacturing_users = User.where(department: 4).ids


document = [
  File.open("./db/documents/'21.07.07_チェリー本_7.2-7.3_クラスの定義.pdf"),
  File.open("./db/documents/'21.07.07_チェリー本_7.4-7.6_クラスの継承.pdf"),
  File.open("./db/documents/'21.07.07_チェリー本_7.7-7.8_メソッドの公開レベル.pdf"),
  File.open("./db/documents/'21.07.07_チェリー本_7.9-7.10_クラスの作成.pdf"),
  File.open("./db/documents/'21.07.07_チェリー本_7.10_クラスの作成.pdf"),
  File.open("./db/documents/'21.07.12_チェリー本_8.1-8.5_モジュールとは.pdf"),
  File.open("./db/documents/'21.07.12_チェリー本_8.6-8.8_モジュールの利用法.pdf"),
  File.open("./db/documents/'21.07.19_チェリー本_6.5-6.6_正規表現.pdf"),
  File.open("./db/documents/'21.07.30_チェリー本_9.2_例外処理.pdf"),
  File.open("./db/documents/'21.07.30_チェリー本_9.6_例外処理.pdf"),
]

content = 'アップ資料は参考です。スクールで学習したRubyのまとめ資料です。'

# r = 0
# 5.times do |j|
#   ProductDocument.create!(user_id: engineering_user,
#                           product_id: odd_product_id[j],
#                           name: '設計計算書',
#                           content: content,
#                           document: document[r],
#                           public_level: 0)
#   r += 1
# end


# r = 5
# 5.times do |j|
#   ProductDocument.create!(user_id: manufacturing_user,
#                           product_id: even_product_id[j],
#                           name: '組立手順書',
#                           content: content,
#                           document: document[r],
#                           public_level: 1)
#   r += 1
# end


# r = 0
# 5.times do |j|
#   CustomerDocument.create!(user_id: sales_user,
#                           customer_id: even_customer_id[j],
#                           name: '注文書',
#                           content: content,
#                           document: document[r],
#                           public_level: 0)
#   r += 1
# end


# r = 5
# 5.times do |j|
#   CustomerDocument.create!(user_id: service_user,
#                           customer_id: even_customer_id[j],
#                           name: 'サービス報告書',
#                           content: content,
#                           document: document[r],
#                           public_level: 0)
#   r += 1
# end

sales_engineering_contact = [
  'お客様よりこの製品の〇〇の改善要望が多くあります。',
  '共有ありがとうございます。マイナーチェンジ時に反映検討します。',
  'このアプリのおかげで情報共有がスマートにできていいですね！'
]

manufacturing_engineering_contact = [
  'この製品の〇〇部の組立方法がわかりません。何か資料いただけますか？',
  '資料をアップしました。資料名「〇〇」をご確認ください',
  'ありがとうございます。次回からこれを見れば良いので便利ですね！'
]


5.times do |i|
  ProductContact.create!(user_id: sales_users[0],
                         product_id: even_product_id[i],
                         contact_message: sales_engineering_contact[0])
end

sleep 1

5.times do |i|
  ProductContact.create!(user_id: engineering_users[0],
                         product_id: even_product_id[i],
                         contact_message: sales_engineering_contact[1])
end

sleep 1

5.times do |i|
  ProductContact.create!(user_id: sales_users[0],
                         product_id: even_product_id[i],
                         contact_message: sales_engineering_contact[2])
end

5.times do |i|
  ProductContact.create!(user_id: manufacturing_users[1],
                         product_id: odd_product_id[i],
                         contact_message: manufacturing_engineering_contact[0])
end

sleep 1

5.times do |i|
  ProductContact.create!(user_id: engineering_users[1],
                         product_id: odd_product_id[i],
                         contact_message: manufacturing_engineering_contact[1])
end

sleep 1

5.times do |i|
  ProductContact.create!(user_id: manufacturing_users[1],
                         product_id: odd_product_id[i],
                         contact_message: manufacturing_engineering_contact[2])
end


sales_planning_engineering_manufacturing_contact = [
  'お客様より〇月納期での引き合いがあります。この条件を満たせば受注獲得できそうですが、生産計画いかがでしょうか？仕様はアップしたファイル「〇〇」を参照ください' ,
  '日程計画します。技術さん、製造さん、この仕様ですが、通常リードタイムに対しプラスで必要であれば教えて下さい',
  '技術としては、この「〇〇」という仕様に+100hrの工数が必要です。',
  '製造としては、追加工数は発生しません。',
  'ありがとうございます。このアプリ内で完結できていいですね！' 
]
  # 客先専用仕様の共有

service_engineering_manufacturing_contact = [
  '製品〇〇の修理で現在客先訪問中です。〇〇の部分が標準品と異なるのですが、何か特殊な仕様でしょうか？',
  'このお客様には〇〇の特殊仕様があります。資料をアップしています。資料名「〇〇」をご確認ください',
  '製造としては〇〇の部分を特殊対応しています。' ,
  'ありがとうございます。担当者が明確になっているので問い合わせ先に困らなくていいですね！' 
]

5.times do |s|
  CustomerContact.create!(user_id: sales_users[1],
                          customer_id: odd_product_id[s],
                          contact_message: sales_planning_engineering_manufacturing_contact[0])
end

sleep 1

5.times do |s|
  CustomerContact.create!(user_id: planning_users[1],
                          customer_id: odd_product_id[s],
                          contact_message: sales_planning_engineering_manufacturing_contact[1])
end

sleep 1

5.times do |s|
  CustomerContact.create!(user_id: engineering_users[1],
                          customer_id: odd_product_id[s],
                          contact_message: sales_planning_engineering_manufacturing_contact[2])
end

sleep 1

5.times do |s|
  CustomerContact.create!(user_id: manufacturing_users[1],
                          customer_id: odd_product_id[s],
                          contact_message: sales_planning_engineering_manufacturing_contact[3])
end

sleep 1

5.times do |s|
  CustomerContact.create!(user_id: sales_users[1],
                          customer_id: odd_product_id[s],
                          contact_message: sales_planning_engineering_manufacturing_contact[4])
end


5.times do |s|
  CustomerContact.create!(user_id: service_user,
                          customer_id: even_product_id[s],
                          contact_message: service_engineering_manufacturing_contact[0])
end

sleep 1

5.times do |s|
  CustomerContact.create!(user_id: engineering_users[0],
                          customer_id: even_product_id[s],
                          contact_message: service_engineering_manufacturing_contact[1])
end

sleep 1

5.times do |s|
  CustomerContact.create!(user_id: manufacturing_users[0],
                          customer_id: even_product_id[s],
                          contact_message: service_engineering_manufacturing_contact[2])
end

sleep 1

5.times do |s|
  CustomerContact.create!(user_id: service_user,
                          customer_id: even_product_id[s],
                          contact_message: service_engineering_manufacturing_contact[3])
end



10.times do |t|
  Schedule.create!(customer_id: customer_id_all[t],
                    serial_number: "123-456-#{t}",
                    line_on: "2021-05-01",
                    completed_on: "2021-06-01",
                    shipmented_on: "2021-07-01",
                    deliveried_on: "2021-08-01")
end

h = 10
10.times do |t|
  Schedule.create!(customer_id: customer_id_all[t],
                    serial_number: "123-456-#{h}",
                    line_on: "2021-05-#{h}",
                    completed_on: "2021-06-#{h}",
                    shipmented_on: "2021-07-#{h}",
                    deliveried_on: "2021-08-#{h}")
  h += 1
end

h = 20
10.times do |t|
  Schedule.create!(customer_id: customer_id_all[t],
                    serial_number: "123-456-#{h}",
                    line_on: "2021-05-#{h}",
                    completed_on: "2021-06-#{h}",
                    shipmented_on: "2021-07-#{h}",
                    deliveried_on: "2021-08-#{h}")
  h += 1
end

h = 30
10.times do |t|
  Schedule.create!(customer_id: customer_id_all[t],
                    serial_number: "123-456-#{h}",
                    line_on: "2021-05-01",
                    completed_on: "2021-06-01",
                    shipmented_on: "2021-07-01",
                    deliveried_on: "2021-08-01")
  h += 1
end

h = 40
10.times do |t|
  Schedule.create!(customer_id: customer_id_all[t],
                    serial_number: "123-456-#{h}",
                    line_on: "2021-06-01",
                    completed_on: "2021-07-01",
                    shipmented_on: "2021-08-01",
                    deliveried_on: "2021-09-01")
  h += 1
end