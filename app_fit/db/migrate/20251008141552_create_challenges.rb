class CreateChallenges < ActiveRecord::Migration[8.0]
  def change
    create_table :challenges do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :visibility
      t.string :category
      t.references :scoring_rule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
