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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
