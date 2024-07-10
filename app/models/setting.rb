class Setting < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :setting_type, presence: true, inclusion: { in: %w[text checkbox radio image video json] }

  before_validation :format_key
  before_save :format_value

  def self.get(key)
    setting = find_by(key: key)
    return unless setting

    setting.setting_type == 'json' ? parse_value(setting.key, setting.value) : setting.value
  end

  def self.set(key, value, type = 'text')
    setting = find_or_initialize_by(key: key)
    setting.value = type == 'json' ? format_value(key, value) : value
    setting.setting_type = type
    setting.save
  end

  private

  def format_key
    self.key = key.parameterize if key.present?
  end

  def format_value
    if setting_type == 'json'
      self.value = self.class.format_value(key, value)
    end
  end

  def self.format_value(key, value)
    if key.include?('address')
      parse_address(value).to_json
    elsif value.is_a?(String)
      value.split(',').map(&:strip).to_json
    else
      value.to_json
    end
  end

  def self.parse_value(key, value)
    if key.include?('address')
      JSON.parse(value)
    else
      value
    end
  end

  def self.parse_address(value)
    parts = value.split(',').map(&:strip)
    {
      line1: parts[0],
      line2: parts[1],
      city: parts[2],
      state: parts[3],
      zip: parts[4]
    }
  end
end
