# frozen_string_literal: true

# Controller for group payments.
class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      @payment.broadcast_prepend_to('payments')
      broadcast_replace_to_total_amount(payment: @payment)
      flash.now.notice = t('payment.flash.notice.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update(payment_params)
      @payment.broadcast_replace_to 'payments'
      broadcast_replace_to_total_amount(payment: @payment)
      flash.now.notice = t('payment.flash.notice.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @payment = Payment.find(params[:id])

    @payment.destroy!
    @payment.broadcast_remove_to('payments')
    broadcast_replace_to_total_amount(payment: @payment)
    flash.now.notice = t('payment.flash.notice.destroy')
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :paid_at, :kind, :name, :note)
  end

  def broadcast_replace_to_total_amount(payment:)
    monthly_expense = MonthlyExpense.new(year: params[:year], month: params[:month])
    total_amount = monthly_expense.total_amount

    payment.broadcast_replace_to(
      'total_amount',
      target: 'total_amount',
      partial: 'monthly_expenses/total_amount',
      locals: { total_amount: }
    )
  end
end
