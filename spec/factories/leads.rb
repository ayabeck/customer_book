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

FactoryGirl.define do
  factory :lead do
    company_name "MyString"
department "MyString"
title "MyString"
name "MyString"
email "MyString"
phone "MyString"
created_on "2015-09-13"
trigger "MyString"
memo "MyText"
event nil
  end

end
