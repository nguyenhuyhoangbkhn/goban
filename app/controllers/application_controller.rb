class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = t "not_authorized"
    redirect_to root_url
  end

  private
  def current_ability
    namespace = controller_path.split("/").first
    Ability.new current_user, namespace
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:name,
      :email, :password, :password_confirmation, :picture,
      :state, :phone)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name,
      :email, :password, :password_confirmation, :picture,
      :state, :phone, :current_password)}
  end
end
