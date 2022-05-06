class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :paid_at, presence: true
  validates :kind, presence: true
  validates :name, presence: true
  validates :note, presence: true

  enum :kind, %i[half individual]
end
