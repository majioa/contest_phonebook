json.array!(@people) do |person|
  json.extract! person, :id, :fullname, :email, :phone, :description
  json.url person_url(person, format: :json)
end
