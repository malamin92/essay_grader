json.array!(@essays) do |essay|
  json.extract! essay, :id, :body
  json.url essay_url(essay, format: :json)
end
