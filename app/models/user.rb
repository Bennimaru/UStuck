class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :categories, through: :posts
  has_many :comments
  validates :name, presence: true
  validates :password, presence: true,length: {in:6..16}
  validates :username, presence:true ,uniqueness:true
end
