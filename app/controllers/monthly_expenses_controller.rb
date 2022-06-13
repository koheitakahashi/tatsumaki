class MonthlyExpensesController < ApplicationController
  def show
    @monthly_expense = MonthlyExpense.new(year: params[:year], month: params[:month])
  end
end
