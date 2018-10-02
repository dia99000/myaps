class AddHueToColors < ActiveRecord::Migration[5.2]
  def change
  	add_column :colors, :hue, :integer
  end
end
