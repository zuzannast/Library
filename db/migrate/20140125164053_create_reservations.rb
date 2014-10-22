class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :book, index: true
      t.references :user, index: true
      t.datetime :date
      t.timestamps
    end
  end
end
