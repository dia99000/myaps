class Tag < ApplicationRecord
	#バリデーション
	validates :name, presence: true
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
end
