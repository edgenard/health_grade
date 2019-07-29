class AddColumnsToHealthInspection < ActiveRecord::Migration[5.2]
  def change
    add_column :health_inspections, :record_date, :date
    add_column :health_inspections, :inspection_type, :text
  end
end
