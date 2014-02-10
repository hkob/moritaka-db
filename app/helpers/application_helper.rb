module ApplicationHelper
  #再帰パスを作成
  def recursive_path(options = {})
    request.symbolized_path_parameters.merge(@ids || {}).merge(options)
  end

  # link 文字列の作成
  def lh(v)
    "[#{v}]"
  end

  # model エラー表示
  def display_error(model)
    if model.errors.any?
      error_hash = model.errors.map { |attr, msg| [attr, model.errors.full_message(attr, msg)] }.reverse.to_h
      render inline:<<-HAML, type: :haml, locals:{error_hash:error_hash}
#error_message
  %ul
    =list_of error_hash.keys.reverse.each do |key|
      =error_hash[key]
HAML
    end
  end

end
