class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :paid_at, presence: true
  validates :kind, presence: true
  validates :name, presence: true

  enum :kind, %i[half individual]

  def self.kinds_18n
    kinds_hash = {}
    kinds.keys.each do |key|
      kinds_hash[I18n.t("activerecord.enums.payment.kind.#{key}")] = key
    end

    kinds_hash
  end
end
