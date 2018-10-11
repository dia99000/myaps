class CardfavsController < ApplicationController

	def create
		@cardfav = Cardfav.new(cardfav_params)
		respond_to do |format|
			if @cardfav.save
				@card = Card.find(params[:card_id])
				format.html {redirect_to @card, notice: 'Added to my Favorite!'}
			else
				format.html {render controller: :cards, action: :show}
			end
		end
	end

	def destroy
		@cardfav = Cardfav.find_by(user_id: current_user.id, card_id: params[:card_id])
		respond_to do |format|
			if @cardfav.delete
				@card = Card.find(params[:card_id])
				format.html {redirect_to @card, notice: 'Deleted from my favorite!'}
			else
				format.html {render controller: :cards, action: :show}
			end
		end
	end

	private

	def cardfav_params
		params.permit(:card_id).merge(user_id: current_user.id)
	end
end
