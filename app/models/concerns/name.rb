module Name
  def name(flag)
    title.name(flag)
  end

  def head1
    title.head[0]
  end

  def names(flag)
    ([ self ] + self.children).map { |o| o.name(flag) }.join(', ')
  end

  def head1_str(flag)
    heads = flag ? ApplicationController::JHeads : ApplicationController::EHeads
    selected = heads[head1.to_i]
    "#{selected.first} - #{selected.last}"
  end

  def head_str(flag)
    heads = flag ? ApplicationController::JHeads : ApplicationController::EHeads
    lhead_hash = heads.flatten.zip(ApplicationController::LHeads).to_h
    lhead_hash.invert[title.head]
  end

  def objects_before_yomi
    self.class.joins(:title).merge(Title.before_yomi(self.title.yomi_suuji)).order_yomi_desc
  end

  def objects_after_yomi
    self.class.joins(:title).merge(Title.after_yomi(self.title.yomi_suuji)).order_yomi
  end

  def objects_before_date
    self.class.before_date(self.date).order_date_desc
  end

  def objects_after_date
    self.class.after_date(self.date).order_date
  end

  def objects_same_date
    self.class.date_value_is(self.date)
  end
end
