class RestorePointsAwardedToProgressEntries < ActiveRecord::Migration[7.0]
  def up
    add_column :progress_entries, :points_awarded, :integer
  end

  def down
    remove_column :progress_entries, :points_awarded
  end
end
