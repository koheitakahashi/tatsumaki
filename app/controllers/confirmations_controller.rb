class ConfirmationsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email].downcase)

    if @user.present? && @user.unconfirmed?
      @user.send_confirmation_email!
      redirect_to root_path, notice: "送信されたメールを確認してください" # TODO: 辞書ファイルにする
    else
      # TODO: 辞書ファイルにする
      new_confirmation_path, alert: "入力されたメールアドレスに一致するユーザーを見つけられませんでした。また、メールアドレスは既に登録されているかもしれません。"
    end
  end

  def edit
    @user = User.find_signed(user_params[:confirmation_token], purpose: :confirm_email)

    if @user.present?
      @user.confirm!
      login @user
      redirect_to root_path, notice: "あなたのアカウントは確認済みです" # TODO: 辞書ファイルにする
    else
      redirect_to new_confirmation_path, alert: "トークンに誤りがあります"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :confirm_email, :confirmation_token)
    end
end
