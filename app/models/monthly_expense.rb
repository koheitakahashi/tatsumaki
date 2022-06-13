class MonthlyExpense
  attr_accessor :year, :month

  def initialize(year: nil, month: nil)
    @year = (year || Time.current.year )
    @month = (month || Time.current.month )
  end

  def current_time
    return @current_time if defined?(@current_time)
    @current_time = DateTime.parse("#{self.year}/#{self.month}")
  end

  def total_amount
    return @total_amount if defined?(@total_amount)
    @total_amount = payments.pluck(:amount).sum
  end

  def payments
    return @payments if defined?(@payments)
    current_month_payments = Payment.where(paid_at: current_time.beginning_of_month..current_time.end_of_month).order(:paid_at, :created_at)
    @payments = (current_month_payments.presence || [])
  end

  def next_year_and_month_hash
    next_datetime = current_time + 1.month
    { year: next_datetime.year, month: next_datetime.month }
  end

  def previous_year_and_month_hash
    previous_datetime = current_time - 1.month
    { year: previous_datetime.year, month: previous_datetime.month }
  end
end
