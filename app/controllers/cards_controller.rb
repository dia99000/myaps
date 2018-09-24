class CardsController < ApplicationController
	before_action :set_card, only: [:show, :edit, :update, :destroy]

	def index
		@mycards = Card.includes(:user).by_id.limit(10)
	end

	def new
		@card = Card.new
	end

	def show
		@desc = Description.new
	end

	def create
		@card = Card.new(card_params)
		respond_to do |format|
			if @card.save
				format.html {redirect_to @card, notice: 'Created！'}
				format.json {render :show, status: :created, location: @card }
			else
				format.html {render :new}
				format.json {render json: @card.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@tag = Tag.find_by(name: params[:card][:name])
		respond_to do |format|
			if @card.update(card_params)
				format.html {redirect_to @card, notice: 'Updated！'}
			else
				format.html {render :show}
			end
		end
	end

	def destroy
		@card.destroy
		respond_to do |format|
			format.html {redirect_to cards_path, notice: 'Deleted！'}
		end
	end

	private

	def set_card
		@card = Card.find(params[:id])
	end

	def card_params
		params.require(:card).permit(:title).merge(user_id: current_user.id)
	end
end