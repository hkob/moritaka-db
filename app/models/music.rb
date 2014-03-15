class Music < ActiveRecord::Base
  validates :song_id, :person_id, presence:true
  belongs_to :song
  belongs_to :person
end
