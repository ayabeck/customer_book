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
#  event_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_leads_on_event_id  (event_id)
#

class Lead < ActiveRecord::Base
  belongs_to :event
  has_many :contacts
end
