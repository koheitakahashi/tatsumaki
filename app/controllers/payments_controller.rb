class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      flash.now.notice = "支払を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update(payment_params)
      flash.now.notice = "支払を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @payment = Payment.find(params[:id])

    @payment.destroy!
    flash.now.notice = "支払を削除しました"
  end

  private
    def payment_params
      params.require(:payment).permit(:amount, :paid_at, :kind, :name, :note)
    end
end
