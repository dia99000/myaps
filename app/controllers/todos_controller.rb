class TodosController < ApplicationController
	def index
		@todos = Todo.by_id.limit(30)
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		respond_to do |format|
			if @todo.save
				format.html{ redirect_to action: :index, notice: 'Created!' }
			else
				format.html{ render tags_path }
			end
		end
	end

	private
	def todo_params
		params.require(:todo).permit(:name)
	end
end
