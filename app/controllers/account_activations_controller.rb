# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  before_action :set_user, only: %i[update]
  skip_before_action :verify_authenticity_token, only: %i[create update]

  def create
    respond_to do |format|
      if current_user
        current_user.send_confirmation_email!

        format.html { redirect_to root_path, notice: I18n.t('account_activations.resend') }
      end
    end
  end

  def update
    if @user.present?
      login(@user)
      @user.confirm_account!
      redirect_to root_path, notice: I18n.t('account_activations.activated')
    else
      redirect_to root_path, alert: I18n.t('account_activations.invalid')
    end
  end

  private

  def set_user
    @user = User.find_by_token_for(:email_confirmation, params[:token])
  end
end
