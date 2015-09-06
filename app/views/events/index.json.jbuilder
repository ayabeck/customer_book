json.array!(@events) do |event|
  json.extract! event, :id, :name, :category, :summary, :date_on
  json.url event_url(event, format: :json)
end
