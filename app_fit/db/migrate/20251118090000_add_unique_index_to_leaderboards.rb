class AddUniqueIndexToLeaderboards < ActiveRecord::Migration[7.1]
  def up
    # Remove duplicates keeping the latest by updated_at
    execute <<~SQL
      DELETE FROM leaderboards a
      USING leaderboards b
      WHERE a.id < b.id
        AND a.challenge_id = b.challenge_id
        AND a.user_id = b.user_id;
    SQL

    add_index :leaderboards, [:challenge_id, :user_id], unique: true, name: 'index_leaderboards_on_challenge_user_unique'
  end

  def down
    remove_index :leaderboards, name: 'index_leaderboards_on_challenge_user_unique'
  end
end
