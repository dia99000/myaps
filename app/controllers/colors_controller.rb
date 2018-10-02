class ColorsController < ApplicationController
	def create
		@color = Color.new(set_color)
		respond_to do |format|
			if @color.save
				format.html{ redirect_to controller: :top, action: :about}
				# format.html{ redirect_to tags_path, notice: 'Created!' }
			else
				format.html{ render tags_path }
			end
		end
	end

	private
	def set_color
		params.require(:color).permit(:hue, :digits)
	end
end
