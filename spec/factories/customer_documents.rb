FactoryBot.define do
  factory :customer_document do
    name { 'customer_document1' }
    content { 'customer_document_content1' }
    public_level { 0 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :customer
  end

  factory :second_customer_document, class: CustomerDocument do
    name { 'customer_document2' }
    content { 'customer_document_content2' }
    public_level { 0 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :customer
  end

  factory :third_customer_document, class: CustomerDocument do
    name { 'customer_document3' }
    content { 'customer_document_content3' }
    public_level { 1 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :customer
  end

  factory :fourth_customer_document, class: CustomerDocument do
    name { 'customer_document4' }
    content { 'customer_document_content4' }
    public_level { 1 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :customer
  end
end
