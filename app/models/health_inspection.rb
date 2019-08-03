class HealthInspection < ApplicationRecord
  enum grade: {
    A: 'A',
    B: 'B',
    C: 'C',
    Z: 'Z',
    P: 'P',
    N: 'N'
  }
end
