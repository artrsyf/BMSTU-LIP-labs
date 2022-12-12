#frozen_string_literal: true

# support methods
class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def if_not_authenticate
    return unless user_signed_in?

    flash[:warning] = 'You are already signed in'
    redirect_to root_path
  end

  def if_authenticate
    return if user_signed_in?

    flash[:warning] = 'You are not signed in'
    redirect_to root_path
  end

  def user_ablities
    redirect_to new_sessions_path unless user_signed_in?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
  end

  helper_method :current_user, :user_signed_in?
end
