class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  AVAILABLE_LOCALES = %w(en ja)

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @is_ja = I18n.locale == :ja
  end

  def default_url_options(options = {})
    { locale:I18n.locale }
  end
end
