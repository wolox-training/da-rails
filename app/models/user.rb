class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true
  has_many :rents, dependent: :destroy
end
