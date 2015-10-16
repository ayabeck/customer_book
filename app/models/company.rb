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

  default_scope { order(name: :asc) }

  # この会社に関連するモデルデータを
  # ユニークかつdate_onが新しい順で返す
  def associated_models
    models = []
    leads = Lead.company_name_is(self.name)

    models.concat(leads)
    leads.each do |lead|
      models.concat(lead.contacts)
      models.concat(lead.events)
    end

    models.sort! { |a,b| a.date_on <=> b.date_on }
    models.uniq.reverse
  end

  def self.search(company_name)
    company_name ? Company.find_by(name: company_name) : nil
  end
end
