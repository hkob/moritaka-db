class Device < ActiveRecord::Base
  include Name
  include Navi
  before_validation do
    if self.date
      y = Year.get_or_create(self.date.year)
      self.year = y if y
    end
    true
  end
  before_destroy do
    self.can_delete?
  end
  belongs_to :year
  belongs_to :title
  belongs_to :singer, class_name: :Person
  scope :device_type_value_is, -> v { where self.arel_table[:device_type].eq(v) }
  scope :device_type_value_has, -> v { where 'devices.device_type & ? = ?', v, v }
  scope :date_value_is, -> v { where self.arel_table[:date].eq(v) }
  scope :after_date, -> v { where arel_table[:date].gt(v) }
  scope :before_date, -> v { where arel_table[:date].lt(v) }
  scope :include_title, -> { includes(:title) }
  scope :order_year, -> { joins(:year).merge(Year.order_year) }
  scope :order_date, -> { order self.arel_table[:date] }
  scope :order_date_desc, -> { order arel_table[:date].desc }
  scope :order_year_date, -> { order_year.order_date }
  scope :order_yomi, -> { joins(:title).merge(Title.order_yomi) }
  scope :order_yomi_desc, -> { joins(:title).merge(Title.order_yomi_desc) }
  scope :order_updated_at_desc, -> { order self.arel_table[:updated_at].desc }

  def self.device_type_hash
    device_type_hash_from_table(self.num2str)
  end

  def self.device_type_options
    self.str2num.to_a.map { |key, value| [ I18n.t("device_type.#{key}"), value ] }
  end

  def can_delete?
    true
  end

  def first_device_type
    ans = nil
    self.class.num2str.keys.each do |num|
      unless device_type & num == 0
        ans = num
        break
      end
    end
    ans
  end

  def single_device_type?
    first_device_type == device_type
  end

  def has_device_type?(dt)
    device_type & dt != 0
  end

  def first_device_type_str
    I18n.t "device_type.#{self.class.num2str[first_device_type]}"
  end

  def device_types
    ans = []
    self.class.num2str.keys.each do |num|
      ans << num unless (device_type & num) == 0
    end
    ans
  end

  def device_types_str
    hash = self.class.num2str
    (I18n.t self.device_types.map { |num| "device_type.#{hash[num]}" }).join(', ')
  end

  def comment(flag)
    flag ? j_comment : e_comment
  end

  def self.recent_singer(n)
    self.order_updated_at_desc.limit(n).map { |l| l.singer }.uniq
  end
end
