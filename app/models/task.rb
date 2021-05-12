class Task < ApplicationRecord
	validates :name, presence: true
	validates :detail, presence: true
	scope :latest, -> { order(expired_at: :DESC) }
	scope :search_name_status, -> (name, status) { where("name LIKE ?", "%#{name}%") && where(status: status)}
	scope :search_status, -> (status) { where(status: status) }
	scope :search_name, -> (name) { where("name LIKE ?", "%#{name}%") }
	enum status:{ 選択してください: 0, 未着手: 1, 着手中: 2, 完了: 3 }
	# enum priority:{ 優先順位: 0, 高: 1, 中: 2, 低: 3 }
end