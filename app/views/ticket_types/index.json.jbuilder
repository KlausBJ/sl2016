json.array!(@ticket_types) do |ticket_type|
  json.extract! ticket_type, :id, :name
  json.url ticket_type_url(ticket_type, format: :json)
end
