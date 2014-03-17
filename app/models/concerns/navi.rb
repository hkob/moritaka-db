module Navi
  def key_str
    self.class.to_s.underscore.pluralize
  end

  def navi_index_str(add_info = nil)
    title = I18n.t "#{self.key_str}.index.title"
    add_info ? "#{title}(#{add_info})" : title
  end

  def navi_show_str(flag)
    title = I18n.t "#{self.key_str}.show.title"
    "#{title}(#{self.name(flag)})"
  end

  def navi_edit_str(flag)
    title = I18n.t "#{self.key_str}.edit.title"
    "#{title}(#{self.name(flag)})"
  end
end
