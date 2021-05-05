class Task < ApplicationRecord
	validates :name, presence: true, length(maximum :10)
	validates :detail, presence: true
end
