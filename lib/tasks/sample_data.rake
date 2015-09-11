namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_events
  end
end

def make_events
  50.times do |n|
    name     = Faker::Company.buzzword
    category = Faker::Lorem.word
    summary  = Faker::Lorem.sentence(5)
    date     = Faker::Date.between(6.months.ago, Date.today)
    Event.create!(name:     name,
                 category: category,
                 summary:  summary,
                 date_on:  date)
  end
end
