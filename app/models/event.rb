# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  category   :string
#  summary    :text
#  date_on    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  has_many :leads

  validates :name, presence: true
  validates :date_on, presence: true

  default_scope { order(date_on: :desc) }

  def self.allowed_attributes
    %w(name category summary date_on)
  end
end
