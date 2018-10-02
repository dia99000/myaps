class TagsController < ApplicationController
		before_action :set_tag, only: [:show, :edit, :update, :destroy]

	def index
		@tags = Tag.includes(:color).search(params[:search]).by_id
		@tag = Tag.new
	end

	def show
		@colors = Color.all
	end

	def create
		@tag = Tag.new(tag_params)
		respond_to do |format|
			if @tag.save
				@tags = Tag.all
				format.html{ redirect_to @tag, notice: 'Created!' }
			else
				format.html{ render tags_path }
			end
		end
	end

	def update
		respond_to do |format|
			if @tag.update(tag_params)
				format.html {redirect_to @tag, notice: 'Updated!'}
			else
				format.html {render :show}
			end
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		respond_to do |format|
			format.html { redirect_to action: :index}
		end
	end

	private
	def set_tag
		@tag = Tag.includes(:color).find(params[:id])
	end

	def tag_params
		params.require(:tag).permit(:name, :color_id)
	end
end
