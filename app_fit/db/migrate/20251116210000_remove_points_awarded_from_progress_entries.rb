class RemovePointsAwardedFromProgressEntries < ActiveRecord::Migration[8.0]
  def change
    remove_column :progress_entries, :points_awarded, :integer
  end
end
