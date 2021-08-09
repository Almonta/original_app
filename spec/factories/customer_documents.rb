FactoryBot.define do
  factory :customer_document do
    name { 'test1' }
    content { 'test1' }
    document { 'test1' }
    public_level { 0 }
    association :user
    association :customer
  end

  factory :second_custoemr_document, class: CustomerDocument do
    name { 'test2' }
    content { 'test2' }
    document { 'test2' }
    public_level { 0 }
    association :user
    association :customer
  end

  factory :third_customer_document, class: CustomerDocument do
    name { 'test3' }
    content { 'test3' }
    document { 'test3' }
    public_level { 0 }
    association :user
    association :customer
  end
end
