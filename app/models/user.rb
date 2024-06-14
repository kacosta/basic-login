# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password_digest, presence: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  enum role: { basic: 0, admin: 1 }

  generates_token_for :email_confirmation, expires_in: 24.hours do
    name
  end

  generates_token_for :password_reset, expires_in: 30.minutes do
    password_salt.last(10)
  end

  def confirmed?
    confirmed_at.present?
  end

  def confirm_account!
    update!(confirmed_at: Time.current)
  end

  def send_confirmation_email!
    UserAccountMailer.with(
      user: self,
      token: generate_token_for(:email_confirmation)
    ).confirm_account.deliver_later
  end

  def send_password_reset_email!
    UserAccountMailer.with(
      user: self,
      token: generate_token_for(:password_reset)
    ).password_reset.deliver_later
  end
end
