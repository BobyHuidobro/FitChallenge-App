class RemovePointsAwardedFromProgressEntries < ActiveRecord::Migration[7.0]
  def up
    remove_column :progress_entries, :points_awarded
  end

  def down
    add_column :progress_entries, :points_awarded, :integer
  end
end
