json.array!(@swim_lessons) do |swim_lesson|
  json.extract! swim_lesson, :id, :code, :place_id, :level_id, :coach_id, :day, :startTime, :endTime, :maxSubscriptions
  json.url swim_lesson_url(swim_lesson, format: :json)
end
