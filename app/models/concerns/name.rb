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
end
