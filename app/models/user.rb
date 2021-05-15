class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }

  before_validation { email.downcase! }
  has_secure_password
  has_many :tasks

  enum admin: { 一般: false, 管理者: true }
  before_destroy :last_one_admin

  private
  def last_one_admin
    if User.where(admin: true).count == 1 && self.admin == "管理者"
      throw(:abort)
    end
  end
end