class CreateScoringRules < ActiveRecord::Migration[8.0]
  def change
    create_table :scoring_rules do |t|
      t.string :rule_type

      t.timestamps
    end
  end
end
