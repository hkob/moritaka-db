module ApplicationHelper
  ButtonLinkClass = { :class => "btn btn-default" }

  #再帰パスを作成
  def recursive_path(options = {})
    request.symbolized_path_parameters.merge(@ids || {}).merge(options)
  end

  def developer_only
    if @is_dev
      @developer_mode = true
      yield
      @developer_mode = false
    end
  end

  def link_to_lh(str, *array)
    link_to lh(str), *array
  end

  # link 文字列の作成
  def lh(v)
    @developer_mode ? "【#{v}】" : v
  end

  # model エラー表示
  def display_error(model)
    if model.errors.any?
      error_hash = model.errors.map { |attr, msg| [attr, model.errors.full_message(attr, msg)] }.reverse.to_h
      render inline:<<-HAML, type: :haml, locals:{error_hash:error_hash}
.alert-danger
  %ul
    =list_of error_hash.keys.reverse.each do |key|
      =error_hash[key]
HAML
    end
  end

  def active_from_class(selected_class)
    controller.class == selected_class ? { class: :active } : {}
  end

  def mgdnw(date)
    I18n.l date, format: :long if date
  end

  def show_title
    "#{t '.title'}#{@subtitle ? "(#{@subtitle})" : ""}"
  end

  def btn_link_class(add_class = nil)
    add_class ? add_class.merge(ButtonLinkClass) : ButtonLinkClass
  end

end
