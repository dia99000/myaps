class AddColorIdDefaultToTags < ActiveRecord::Migration[5.2]
  def change
		change_column :tags, :color_id, :integer, default: 55
		remove_column :tags, :color, :string
		drop_table :palettes
  end
end
