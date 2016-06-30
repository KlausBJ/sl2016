json.array!(@members) do |member|
  json.extract! member, :id, :number, :email, :name
  json.url member_url(member, format: :json)
end
