class Card < ApplicationRecord
	#バリデーション
	validates :title, presence: true
	#表示
	scope :by_id, -> { order(updated_at: :desc)}
end
