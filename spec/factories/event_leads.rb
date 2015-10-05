# == Schema Information
#
# Table name: event_leads
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  lead_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_event_leads_on_event_id  (event_id)
#  index_event_leads_on_lead_id   (lead_id)
#

FactoryGirl.define do
  factory :event_lead do
    event nil
lead nil
  end

end
