class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    presence: true,
                    uniqueness: true
  validates :name, presence: true

  def confirm!
    update_columns(confirmed_at: Time.current)
  end

  def confirmed?
    confirmed_at.present?
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end
end
