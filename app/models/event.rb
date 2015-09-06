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
  validates :name, presence: true
end
