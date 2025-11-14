class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :role, inclusion: { in: %w[user admin] }

  def admin?
    role == "admin"
  end
end
