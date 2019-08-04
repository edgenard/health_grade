# frozen_string_literal: true

class DropViolationColumnsFromHealthInspection < ActiveRecord::Migration[5.2]
  # rubocop:disable Rails/ReversibleMigration
  def change
    change_table :health_inspections, bulk: true do |t|
      t.remove :violation_code, :string
      t.remove :violation_description, :text
      t.remove :critical_flat, :string
    end
  end
  # rubocop:enable Rails/ReversibleMigration
end
