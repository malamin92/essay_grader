json.array!(@grades) do |grade|
  json.extract! grade, :id, :essay_id, :comments, :grader
  json.url grade_url(grade, format: :json)
end
