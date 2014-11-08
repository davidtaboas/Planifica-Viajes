class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :html, :json
  before_action :set_locale
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :export_i18n_messages


  protect_from_forgery with: :null_session


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def export_i18n_messages
    SimplesIdeias::I18n.export! if Rails.env.development?
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

end
