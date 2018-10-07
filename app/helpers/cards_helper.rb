module CardsHelper

	def show_updated_at(card)
		cards = card.updated_at.to_s.split(" ")
		cards[0]
	end

	def show_created_at(card)
		cards = card.created_at.to_s.split(" ")
		cards[0]
	end

end
