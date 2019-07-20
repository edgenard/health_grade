class CreateHealthInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :health_inspections do |t|
      t.date :inspection_date
      t.text :action
      t.string :violation_code
      t.text :violation_description
      t.string :critical_flag
      t.integer :score
      t.date :grade_date
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
