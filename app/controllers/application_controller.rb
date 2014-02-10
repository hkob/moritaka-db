class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  AVAILABLE_LOCALES = %w(en ja)
  include YomiSuuji
  JHeads = %w(あ い う え お か き く け こ さ し す せ そ た ち つ て と な に ぬ ね の は ひ ふ へ ほ ま み む め も や ゆ よ ら り る れ ろ わ を)
  EHeads = %w(A I U E O KA KI KU KE KO SA SHI SU SE SO TA CHI TSU TE TO NA NI NU NE NO HA HI FU HE HO MA MI MU ME MO YA YU YO RA RI RU RE RO WA WO)

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @is_ja = I18n.locale == :ja
    @is_dev = ! Rails.env.production?
  end

  def default_url_options(options = {})
    { locale:I18n.locale }
  end

  def reject_production
    if @is_dev
      true
    else
      redirect_to root_path
    end
  end
end
