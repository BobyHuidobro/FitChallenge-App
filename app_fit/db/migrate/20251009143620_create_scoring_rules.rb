class CreateScoringRules < ActiveRecord::Migration[8.0]
  def change
    create_table :scoring_rules do |t|
      t.string :rule_type
      t.text :description
      t.references :user, foreign_key: true, null: true
      t.boolean :public, default: false, null: false

      t.timestamps
    end
  end
end
