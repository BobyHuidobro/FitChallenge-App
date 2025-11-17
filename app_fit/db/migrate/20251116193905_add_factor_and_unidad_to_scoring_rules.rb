class AddFactorAndUnidadToScoringRules < ActiveRecord::Migration[8.0]
  def change
    add_column :scoring_rules, :factor, :integer
    add_column :scoring_rules, :unidad, :integer
  end
end
