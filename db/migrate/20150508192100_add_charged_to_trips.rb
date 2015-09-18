class AddChargedToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :charged, :boolean
  end
end
