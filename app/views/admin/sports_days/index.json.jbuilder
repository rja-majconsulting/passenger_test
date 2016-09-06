json.array!(@sports_days) do |sports_day|
  json.extract! sports_day, :id, :code, :place_id, :date, :price, :startTime, :endTime, :morningPlace, :afternoonPlace, :paymentDate
  json.url sports_day_url(sports_day, format: :json)
end
