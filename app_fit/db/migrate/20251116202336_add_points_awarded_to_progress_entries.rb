class AddPointsAwardedToProgressEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :progress_entries, :points_awarded, :integer
  end
end
