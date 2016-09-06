json.array!(@sports_training_subscriptions) do |sports_training_subscription|
  json.extract! sports_training_subscription, :id
  json.url sports_training_subscription_url(sports_training_subscription, format: :json)
end
