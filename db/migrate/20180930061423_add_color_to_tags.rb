class AddColorToTags < ActiveRecord::Migration[5.2]
  def change
		rename_column :tags, :color, :color_id
		add_column :tags, :color, :string
  end
end
