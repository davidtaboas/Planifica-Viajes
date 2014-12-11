class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :html, :json
  before_action :set_locale
  before_action :set_metatags
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :export_i18n_messages


  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => t("exception.accessdenied")
  end

  def set_metatags

    set_meta_tags :site => t("Title"),
                  :reverse => true,
                  :description => 'Member login page.',
                  :keywords => 'Site, Login, Members',
                  :canonical => "http://yoursite.com/canonical/url",
                  :alternate => { "fr" => "http://yoursite.fr/alternate/url",
                                  "de" => "http://yoursite.de/alternate/url" }
  end

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def export_i18n_messages
    SimplesIdeias::I18n.export! if Rails.env.development?
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

end
