class Tag < ApplicationRecord
	#バリデーション
	validates :name, presence: true
  has_many :card_tags, dependent: :destroy
  has_many :cards, through: :card_tags
  belongs_to :color
	#表示
	scope :by_id, -> { order(updated_at: :desc)}
	#searchメソッド
	def self.search(search)
		if search
			Tag.where(['name LIKE ?', "%#{search}%"])
		else
			Tag.all
		end
	end
	#delegates
	delegate :digits, to: :color, prefix: :color, allow_nil: true
end
