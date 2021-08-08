FactoryBot.define do
  factory :user do
    name { 'test_user1' }
    email { 'test_user1@sample.com' }
    password { 'test_user1' }
    password_confirmation { 'test_user1' }
    admin { 'false' }
  end
end
