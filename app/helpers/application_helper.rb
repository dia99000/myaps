module ApplicationHelper
	def search_form(model)
		'
		<%= form_with(url: ' + model + 's_path, method: :get, local: true) do |form| %>
			<div class="field">
				<%= form.text_field :search %>
				<%= button_tag :type => "submit" do %>
					<i class="fa fa-search" ></i>
				<% end %>
			</div>
		<% end %>
		'
	end
end
