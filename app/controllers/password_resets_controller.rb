# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :set_user_by_token, only: %i[edit update]
  before_action :set_user_by_email, only: :create

  def new
    @user = User.new
  end

  def edit
    redirect_to root_path, alert: I18n.t('password_resets.invalid_token') and return unless @user

    render :edit
  end

  def create
    if @user
      @user.send_password_reset_email!
      redirect_to root_path, notice: I18n.t('password_resets.created')
    else
      flash.now[:alert] = I18n.t('password_resets.not_found')
      render :new, status: :not_found
    end
  end

  def update
    redirect_to root_path, alert: I18n.t('password_resets.invalid_token') and return unless @user

    if @user.update(password_reset_params)
      redirect_to root_path, notice: I18n.t('password_resets.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user_by_token
    @user = User.find_by_token_for(:password_reset, token_reset_param)
  end

  def set_user_by_email
    @user = User.find_by(email: user_params[:email])
  end

  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def token_reset_param
    @token_reset_param ||= params[:token]
  end
end
