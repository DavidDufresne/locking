class ChangeTripsLockVersionDefault < ActiveRecord::Migration
  def change
    change_column_default :trips, :lock_version, 0
  end
end
