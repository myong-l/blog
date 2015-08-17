class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:password, :password_confirmation, :email, :username, :image) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:password, :email) }
    devise_parameter_sanitizer.for(:account_update) << :image 
  end
end
