class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  AVAILABLE_LOCALES = %w(en ja)
  include YomiSuuji
  JHeads = [ %w(あ い う え お), %w(か き く け こ), %w(さ し す せ そ), %w(た ち つ て と), %w(な に ぬ ね の), %w(は ひ ふ へ ほ), %w(ま み む め も), %w(や ゆ よ), %w(ら り る れ ろ), %w(わ を) ]
  EHeads = [ %w(A I U E O), %w(KA KI KU KE KO), %w(SA SHI SU SE SO), %w(TA CHI TSU TE TO), %w(NA NI NU NE NO), %w(HA HI FU HE HO), %w(MA MI MU ME MO), %w(YA YU YO), %w(RA RI RU RE RO), %w(WA WO) ]
  LHeads = %w(00 01 02 03 04 10 11 12 13 14 20 21 22 23 24 30 31 32 33 34 40 41 42 43 44 50 51 52 53 54 60 61 62 63 64 70 72 74 80 81 82 83 84 90 94)
  LHeads2 = %w(00 10 20 30 40 50 60 70 80 90)

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

  def get_objects_and_ids(array, first_id = true)
    ans = []
    ids = {}
    array.each_with_index do |model, i|
      id = i == 0 && first_id ? 'id' : "#{model.to_s.underscore}_id"
      if pid = params[id]
        ans << model.find(pid)
        ids[id] = pid
      else
        ans << nil
      end
    end
    ans << ids
  end
end
