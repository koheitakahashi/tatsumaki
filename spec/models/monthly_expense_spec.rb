require 'rails_helper'

# TODO: テストを追加する
RSpec.describe MonthlyExpense, type: :model do
  subject(:monthly_expense) { MonthlyExpense.new(year: 2022, month: 06) }

  describe "#current_time" do
    it { expect(monthly_expense.current_time.strftime("%Y%m")).to eq "202206" }
  end

  describe "#total_amount" do

  end

  describe "#payments" do
  end

  describe "#next_year_and_month_hash" do
  end

  describe "#previous_year_and_month_hash" do
  end
end
