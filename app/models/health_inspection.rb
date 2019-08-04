# frozen_string_literal: true

class HealthInspection < ApplicationRecord
  belongs_to :restaurant, foreign_key: :camis, inverse_of: :health_inspections
  has_many :violations, dependent: :destroy
  enum grade: {
    A: "A",
    B: "B",
    C: "C",
    Z: "Z",
    P: "P",
    N: "N",
  }
end
