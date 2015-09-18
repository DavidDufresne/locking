class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.integer :price

      t.timestamps null: false
    end
  end
end
