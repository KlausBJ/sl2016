json.array!(@registrations) do |registration|
  json.extract! registration, :id, :name, :member_id, :ticket_type_id
  json.url registration_url(registration, format: :json)
end
