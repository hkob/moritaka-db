class Music < ActiveRecord::Base
  validates :song_id, :person_id, presence:true
  belongs_to :song
  belongs_to :person
  scope :order_sort_order, -> { order self.arel_table[:sort_order] }

  def name(flag)
    "#{song.name(flag)}:#{person.name(flag)}"
  end
end
