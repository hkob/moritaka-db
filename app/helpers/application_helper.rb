module ApplicationHelper
  #再帰パスを作成
  def recursive_path(options = {})
    request.symbolized_path_parameters.merge(@ids || {}).merge(options)
  end

  # link 文字列の作成
  def lh(v)
    "[#{v}]"
  end
end
