class TagsController < ApplicationController
		before_action :set_tag, only: [:show, :edit, :update, :destroy]

	def index
		@tags = Tag.search(params[:search]).by_id
		@tag = Tag.new
	end

	def show
	end

	def create
		@tag = Tag.new(tag_params)
		respond_to do |format|
			if @tag.save
				@tags = Tag.all
				format.json{ render json: @tags}
				# format.html{ redirect_to tags_path, notice: 'Created!' }
			else
				format.html{ render tags_path }
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
		@tag = Tag.find(params[:id])
	end

	def tag_params
		params.require(:tag).permit(:name, :color)
	end
end
