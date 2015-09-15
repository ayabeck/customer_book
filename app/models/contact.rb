# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  date_on    :date
#  content    :text
#  means      :string
#  owner      :string
#  lead_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_contacts_on_lead_id  (lead_id)
#

class Contact < ActiveRecord::Base
  belongs_to :lead
end
