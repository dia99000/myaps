class CreateTops < ActiveRecord::Migration[5.2]
  def change
    create_table :tops do |t|
      t.string :memo
      t.integer :status

      t.timestamps
    end
  end
end
