# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  name          :string
#  business_type :string
#  outline       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Company < ActiveRecord::Base
  validates :name, presence: true
end
