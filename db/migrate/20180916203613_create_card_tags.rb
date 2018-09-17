class CreateCardTags < ActiveRecord::Migration[5.2]
  def change
    create_table :card_tags do |t|
      t.references :card, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
