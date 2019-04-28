class User < ApplicationRecord
  validates :name, presence: true, length: { in: 1..15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { in: 8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :topics

  has_secure_password
end
