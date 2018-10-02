class Description < ApplicationRecord
  belongs_to :card
	#バリデーション
	validates :content, presence: true
end
