class Card < ApplicationRecord
	#アソシエーション
	belongs_to :user
  has_many :tags, through: :card_tags
  has_many :card_tags
	#バリデーション
	validates :title, presence: true
	#表示
	scope :by_id, -> { order(updated_at: :desc)}
end
