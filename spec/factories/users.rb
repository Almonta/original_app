FactoryBot.define do
  factory :user do
    name { 'test_user1' }
    department { 'test_department1' }
    email { 'test_user1@sample.com' }
    password { 'test_pass1' }
    password_confirmation { 'test_pass1' }
    admin { 'false' }
  end
end
