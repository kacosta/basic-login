# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password_digest, presence: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  enum role: { user: 0, admin: 1 }
end
