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

FactoryGirl.define do
  factory :company do
    name "MyString"
business_type "MyString"
outline "MyText"
  end

end
