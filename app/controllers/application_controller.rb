class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!, :check_admin_authorization, :initialize_cart_session

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :full_name
    devise_parameter_sanitizer.for(:sign_up) << :departamento
    devise_parameter_sanitizer.for(:sign_up) << :cargo
    devise_parameter_sanitizer.for(:sign_up) << :siape
    devise_parameter_sanitizer.for(:sign_up) << :telefone

    devise_parameter_sanitizer.for(:account_update) << :full_name
    devise_parameter_sanitizer.for(:account_update) << :departamento
    devise_parameter_sanitizer.for(:account_update) << :cargo
    devise_parameter_sanitizer.for(:account_update) << :siape
    devise_parameter_sanitizer.for(:account_update) << :telefone
  end

  private
  def check_admin_authorization
    if user_signed_in? && !current_user.admin_authorization
      reset_session
      redirect_to new_user_session_path, alert: "O Administrador do sistema precisa aprovar seu cadastro para que você possa ter acesso."
    end
  end

  def initialize_cart_session
    session['cart'] ||= []
  end
end
