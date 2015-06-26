json.array!(@questions) do |question|
  json.extract! question, :id, :title, :question_description, :profile_user_id, :profile_expert_id, :question_type, :genre_id
  json.url question_url(question, format: :json)
end
