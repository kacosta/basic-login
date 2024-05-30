# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :logged_in?
  end

  def login(user)
    reset_session
    session[:user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  private

  def current_user
    Current.user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end
end
