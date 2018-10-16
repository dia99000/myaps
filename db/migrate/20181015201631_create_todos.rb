class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :name ,		:null => false
      t.boolean :carded ,	:null => false, :default => false
      t.boolean :done,		:null => false, :default => false

      t.timestamps
    end
  end
end
