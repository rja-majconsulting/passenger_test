json.array!(@sports_trainings) do |sports_training|
  json.extract! sports_training, :id, :code, :place_id, :startDate, :endDate, :startTime, :endTime, :halfDayPrice, :fullDayPrice, :morningNursery, :afternoonNursery
  json.url sports_training_url(sports_training, format: :json)
end
