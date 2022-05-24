class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :paid_at, presence: true
  validates :kind, presence: true
  validates :name, presence: true

  enum :kind, %i[half individual]

  broadcasts_to -> (payment) { "payments" }

  def self.total_amount(term)
    raise ArgumentError, "" unless term.is_a?(Range)

    Payment.where(paid_at: term).sum(:amount)
  end
end
