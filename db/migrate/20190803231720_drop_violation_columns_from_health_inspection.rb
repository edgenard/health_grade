class DropViolationColumnsFromHealthInspection < ActiveRecord::Migration[5.2]
  def change
    remove_column :health_inspections, :violation_code
    remove_column :health_inspections, :violation_description
    remove_column :health_inspections, :critical_flag
  end
end
