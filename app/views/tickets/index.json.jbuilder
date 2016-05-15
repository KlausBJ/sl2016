json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :deltager, :member_id, :activity_id
  json.url ticket_url(ticket, format: :json)
end
