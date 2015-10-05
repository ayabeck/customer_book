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

require 'rails_helper'

RSpec.describe Lead, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
