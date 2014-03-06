class Song < ActiveRecord::Base
  include Name
  validates :title_id, presence:true
  belongs_to :title
  belongs_to :year

  def can_delete?
    true
  end
end
