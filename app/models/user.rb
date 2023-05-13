class User < ApplicationRecord
  has_secure_password

  has_one :blog, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: [:admin, :writer, :editor]
end
