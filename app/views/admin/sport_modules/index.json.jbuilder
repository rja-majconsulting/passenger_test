json.array!(@sport_modules) do |sport_module|
  json.extract! sport_module, :id, :code, :place_id, :activity_id, :coach_id, :day, :startTime, :endTime, :maxSubscriptions, :meetingPlace
  json.url sport_module_url(sport_module, format: :json)
end
