FactoryBot.define do
  factory :user do
    name { 'user1' }
    department { 1 }
    email { 'user1@sample.com' }
    password { 'pass1111' }
    password_confirmation { 'pass1111' }
    admin { 'false' }
  end

  factory :second_user, class: User do
    name { 'user2' }
    department { 2 }
    email { 'user2@sample.com' }
    password { 'pass2222' }
    password_confirmation { 'pass2222' }
    admin { 'false' }
  end

  factory :admin, class: User do
    name { 'admin_user1' }
    department { 0 }
    email { 'admin_user1@sample.com' }
    password { 'pass3333' }
    password_confirmation { 'pass3333' }
    admin { 'true' }
  end
end
