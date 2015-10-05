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

require 'rails_helper'

RSpec.describe EventLead, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
