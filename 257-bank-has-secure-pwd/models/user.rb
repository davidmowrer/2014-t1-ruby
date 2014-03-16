class User < ActiveRecord::Base
  has_many :accounts
  validates :username, presence: true
  validates :username, uniqueness: true
  has_secure_password
end
