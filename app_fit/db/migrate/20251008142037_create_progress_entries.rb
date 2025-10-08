class CreateProgressEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :progress_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.date :entry_date
      t.integer :points_awarded
      t.integer :quantity
      t.boolean :approved

      t.timestamps
    end
  end
end
