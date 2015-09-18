class AddLockVersionToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :lock_version, :integer
  end
end
