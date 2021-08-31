FactoryBot.define do
  factory :customer do
    number { '111' }
    name { 'customer1' }
    association :user
  end

  factory :second_customer, class: Customer do
    number { '222' }
    name { 'customer2' }
    association :user
  end

  factory :third_customer, class: Customer do
    number { '333' }
    name { 'customer3' }
    association :user
  end
end
