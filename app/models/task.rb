class Task < ApplicationRecord
	validates :title, presence: true
	validates :detail, presence: true

	belongs_to :user

	scope :search_title_status, -> (title, status, user_id) { where(user_id: user_id).where("title LIKE ?", "%#{title}%").where(status: status) }
	scope :search_status, -> (status, user_id) { where(status: status).where(user_id: user_id) }
	scope :search_title, -> (title, user_id) { where(user_id: user_id).where("title LIKE ?", "%#{title}%") }
	enum status: { 未着手: 0, 着手中: 1, 完了: 2 }
	enum priority: { 高: 0, 中: 1, 低: 2 }
end