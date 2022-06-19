# frozen_string_literal: true

# Controller for monthly payments.
class MonthlyExpensesController < ApplicationController
  def show
    @monthly_expense = MonthlyExpense.new(year: params[:year], month: params[:month])
  end
end
