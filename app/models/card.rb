class Card < ApplicationRecord
	#アソシエーション
	belongs_to :user
	has_many :descriptions
  has_many :card_tags, dependent: :destroy
  has_many :tags, through: :card_tags
	#バリデーション
	validates :title, presence: true
	#表示
	scope :by_id, -> { order(updated_at: :desc)}
	accepts_nested_attributes_for :card_tags, allow_destroy: true
	#searchメソッド
	def self.search(search)
		if search
			Card.where(['title LIKE ?', "%#{search}%"])
		else
			Card.all
		end
	end

end
