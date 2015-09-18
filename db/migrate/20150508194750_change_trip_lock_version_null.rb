class ChangeTripLockVersionNull < ActiveRecord::Migration
  def change
    change_column_null :trips, :lock_version, false, 0
  end
end
