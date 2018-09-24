class RenameCardIdIdColumnToDescriptions < ActiveRecord::Migration[5.2]
  def change
		rename_column :descriptions, :card_id_id, :card_id
  end
end
