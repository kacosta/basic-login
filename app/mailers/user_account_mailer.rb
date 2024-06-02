# frozen_string_literal: true

class UserAccountMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_account_mailer.confirm_account.subject
  #
  def confirm_account
    @user = params[:user]
    mail to: @user.email
  end
end
