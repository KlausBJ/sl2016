json.array!(@activities) do |activity|
  json.extract! activity, :id, :navn, :sted, :dag, :tid
  json.url activity_url(activity, format: :json)
end
