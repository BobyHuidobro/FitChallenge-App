class MigrateOldProgressPoints < ActiveRecord::Migration[8.0]
  def up
    ProgressEntry.reset_column_information
    ProgressEntry.find_each do |entry|
      if entry.points_awarded.present?
        entry.update_column(:legacy_points, entry.points_awarded)
      end
    end
  end

  def down
    ProgressEntry.update_all(legacy_points: nil)
  end
end
