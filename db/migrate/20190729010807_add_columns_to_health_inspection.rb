# frozen_string_literal: true

class AddColumnsToHealthInspection < ActiveRecord::Migration[5.2]
  def change
    change_table :health_inspections, bulk: true do |t|
      t.column :record_date, :date
      t.column :inspection_type, :text
    end
  end
end
