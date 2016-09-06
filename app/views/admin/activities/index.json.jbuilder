json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :material, :maxSubscriptions
  json.url activity_url(activity, format: :json)
end
