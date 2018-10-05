module CardsHelper

	def show_date(card)
		if card.updated_at
			cards = card.updated_at.to_s.split(" ")
			cards[0]
		elsif card.created_at
			cards = card.created_at.to_s.split(" ")
			cards[0]
		else
			# ここにエラー文を記述
			return "-"
		end
	end

end
