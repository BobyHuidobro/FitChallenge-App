class CreateParticipations < ActiveRecord::Migration[8.0]
  def change
    create_table :participations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.timestamp :joined_at
      t.string :status
      t.integer :total_points

      t.timestamps
    end
  end
end
