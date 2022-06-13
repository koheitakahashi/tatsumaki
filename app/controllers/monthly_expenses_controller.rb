class MonthlyExpensesController < ApplicationController
  def show
    @monthly_expenses = MonthlyExpense.new(year: params[:year], month: params[:month])
  end
end
