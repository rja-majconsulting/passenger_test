json.array!(@coaches) do |coach|
  json.extract! coach, :id, :lastName, :firstName, :telefonNumber, :email
  json.url coach_url(coach, format: :json)
end
