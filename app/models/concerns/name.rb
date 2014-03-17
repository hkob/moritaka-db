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

end
