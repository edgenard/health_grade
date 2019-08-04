# frozen_string_literal: true

class Restaurant < ApplicationRecord
  self.primary_key = :camis
  has_many :health_inspections, dependent: :destroy
end
