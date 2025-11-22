class CopyPointsAwardedToLegacyPoints < ActiveRecord::Migration[7.0]
  def up
    # copia los valores de points_awarded a legacy_points solo si legacy_points está en nil
    ProgressEntry.reset_column_information
    ProgressEntry.where(legacy_points: nil).find_each do |pe|
      if pe.points_awarded.present?
        pe.update_column(:legacy_points, pe.points_awarded)
      end
    end
  end

  def down
  end
end
