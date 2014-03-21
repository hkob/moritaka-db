class Lyric < ActiveRecord::Base
  validates :song_id, :person_id, presence:true
  belongs_to :song
  belongs_to :person
  scope :order_sort_order, -> { order self.arel_table[:sort_order] }
  scope :order_updated_at_desc, -> { order self.arel_table[:updated_at].desc }
  scope :order_song_date, -> { joins(:song).merge(Song.order_date) }

  def name(flag)
    "#{song.name(flag)}:#{person.name(flag)}"
  end

  def self.recent_people(n)
    Lyric.order_updated_at_desc.limit(n).map { |l| l.person }.uniq
  end
end
