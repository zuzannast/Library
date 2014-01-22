class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
