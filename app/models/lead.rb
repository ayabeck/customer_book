# == Schema Information
#
# Table name: leads
#
#  id           :integer          not null, primary key
#  company_name :string
#  department   :string
#  title        :string
#  name         :string
#  email        :string
#  phone        :string
#  date_on      :date
#  trigger      :string
#  memo         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Lead < ActiveRecord::Base
  has_many :event_leads, dependent: :destroy
  has_many :events, through: :event_leads
  has_many :contacts

  validates :company_name, presence: true
  validates :date_on, presence: true

  default_scope { order(date_on: :desc) }
end
