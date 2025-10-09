class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w[user admin] }

  def admin?
    role == "admin"
  end
end
