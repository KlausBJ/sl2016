json.array!(@registrations) do |registration|
  json.extract! registration, :id, :voksen, :ung, :boern, :baby, :member_id
  json.url registration_url(registration, format: :json)
end
