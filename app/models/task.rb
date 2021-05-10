class Task < ApplicationRecord
	validates :name, presence: true
	validates :detail, presence: true
	scope :latest, -> {order(expired_at: :desc)}

	enum status:{ 未着手: 0, 着手中: 1, 完了: 2 }
end
