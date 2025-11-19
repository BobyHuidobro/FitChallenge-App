class MigrateOldProgressPoints < ActiveRecord::Migration[8.0]
  # Use a lightweight AR class to avoid app-level validations/callbacks during migration
  class PE < ActiveRecord::Base
    self.table_name = "progress_entries"
  end

  def up
    # If the source column no longer exists, nothing to migrate
    return unless column_exists?(:progress_entries, :points_awarded)

    # Ensure destination column exists
    add_column :progress_entries, :legacy_points, :integer unless column_exists?(:progress_entries, :legacy_points)

    # Perform backfill directly in SQL for performance
    execute <<~SQL
      UPDATE progress_entries
      SET legacy_points = points_awarded
      WHERE points_awarded IS NOT NULL
        AND (legacy_points IS NULL OR legacy_points <> points_awarded)
    SQL
  end

  def down
    return unless column_exists?(:progress_entries, :legacy_points)
    # Only clear the backfilled column; do not attempt to recreate points_awarded
    PE.update_all(legacy_points: nil)
  end
end
