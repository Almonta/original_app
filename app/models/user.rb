class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(name: 'ゲスト', department: 0, email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.admin_guest
    find_or_create_by!(name: '管理者', department: 0, email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end

  enum department: { no_position: 0,
                     sales: 1,
                     engineering: 2,
                     planning: 3,
                     manufacturing: 4,
                     service: 5 }

  has_many :products
  has_many :user_products, dependent: :destroy
  has_many :registered_products, through: :user_products, source: :product
  has_many :customers
  has_many :user_customers, dependent: :destroy
  has_many :registered_customers, through: :user_customers, source: :customer
end
