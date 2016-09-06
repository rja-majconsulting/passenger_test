json.array!(@sports_day_subscriptions) do |sports_day_subscription|
  json.extract! sports_day_subscription, :id
  json.url sports_day_subscription_url(sports_day_subscription, format: :json)
end
