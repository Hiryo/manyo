class Task < ApplicationRecord
	validates :name, presence: true
	validates :detail, presence: true
	scope :latest, -> {order(expired_at: :desc)}
end
