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

FactoryGirl.define do
  factory :event do
    name "MyString"
category "MyString"
summary "MyText"
date_on "2015-09-04"
  end

end
