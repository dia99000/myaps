class Todo < ApplicationRecord
	#バリデーション
	validates :name, presence: true
	#表示
	scope :by_id, -> { order(updated_at: :desc)}
end
