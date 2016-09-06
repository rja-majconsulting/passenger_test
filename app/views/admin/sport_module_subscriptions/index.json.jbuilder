json.array!(@sport_module_subscriptions) do |sport_module_subscription|
  json.extract! sport_module_subscription, :id
  json.url sport_module_subscription_url(sport_module_subscription, format: :json)
end
