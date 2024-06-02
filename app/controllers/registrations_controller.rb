# frozen_string_literal: true

class RegistrationsController < ApplicationController
  before_action :redirect_if_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    respond_to do |format|
      if @user.save
        @user.send_confirmation_email!
        format.html { redirect_to root_path, notice: I18n.t('registrations.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def registration_params
    params.require(:user).permit(:name, :last_name, :birthdate, :email, :password, :password_confirmation)
  end
end
