module Head
  def get_heads(phead, is_ja)
    heads = is_ja ? ApplicationController::JHeads : ApplicationController::EHeads
    lhead_hash = heads.map { |a| a.first}.zip(ApplicationController::LHeads2.map { |h| h[0] }).to_h
    selected = heads[phead.to_i]
    head_str = "#{selected.first} - #{selected.last}"
    ids = { head:phead }
    [ phead, heads, lhead_hash, head_str, ids ]
  end
end

