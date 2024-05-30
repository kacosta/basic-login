# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password])
      login(@user)
      redirect_to root_path, notice: I18n.t('sessions.created')
    else
      flash.now[:alert] = I18n.t('sessions.invalid')
      render :new, status: :unauthorized
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: I18n.t('sessions.destroyed')
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
