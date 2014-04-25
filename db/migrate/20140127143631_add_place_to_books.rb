class AddPlaceToBooks < ActiveRecord::Migration
  def change
    add_column :books, :place, :string
  end
end
