class CreateLeaderboards < ActiveRecord::Migration[8.0]
  def change
    create_table :leaderboards do |t|
      t.references :challenge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :total_points
      t.integer :rank

      t.timestamps
    end
  end
end
