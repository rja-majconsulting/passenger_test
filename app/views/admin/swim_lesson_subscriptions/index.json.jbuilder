json.array!(@swim_lesson_subscriptions) do |swim_lesson_subscription|
  json.extract! swim_lesson_subscription, :id
  json.url swim_lesson_subscription_url(swim_lesson_subscription, format: :json)
end
