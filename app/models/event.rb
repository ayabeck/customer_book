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
  has_many :event_leads, dependent: :destroy
  has_many :leads, through: :event_leads

  validates :name, presence: true
  validates :date_on, presence: true

  default_scope { order(date_on: :desc) }
end
