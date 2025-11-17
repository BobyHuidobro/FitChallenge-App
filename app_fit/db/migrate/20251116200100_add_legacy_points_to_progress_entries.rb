class AddLegacyPointsToProgressEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :progress_entries, :legacy_points, :integer
  end
end
