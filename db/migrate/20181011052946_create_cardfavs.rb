class CreateCardfavs < ActiveRecord::Migration[5.2]
  def change
    create_table :cardfavs do |t|
      t.references :user, null:false
      t.references :card, null:false

      t.timestamps
    end
  end
end
