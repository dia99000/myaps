class CardsController < ApplicationController
	before_action :set_card, only: [:show, :edit, :update, :destroy]
	before_action :set_new_card, only: [:index, :new]

	PER = 10

	def index
		@cards = Card.includes(:user).search(params[:search]).by_id.page(params[:page]).per(PER)
	end

	def new
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
		@tag = Tag.find_or_create_by(name: params[:card][:name])
		# if Tag.find_by(name: params[:card][:name])
		# 	@tag = Tag.find_by(name: params[:card][:name])
		# else
		# 	@tag = Tag.create(name: params[:card][:name])
		# end

		CardTag.create(card_id: params[:id], tag_id: @tag.id)
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

	def set_new_card
		@card = Card.new
	end

	def card_params
		params.require(:card).permit(:title, :tag_id).merge(user_id: current_user.id)
	end
end