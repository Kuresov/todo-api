class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_secure_token :auth_token
  has_secure_password

  validates :email, presence: true,
                    uniqueness: true
  validates :password, length: { minimum: 6, maximum: 72 }, on: :create

end
