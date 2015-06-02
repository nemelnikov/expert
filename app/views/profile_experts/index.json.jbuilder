json.array!(@profile_experts) do |profile_expert|
  json.extract! profile_expert, :id, :first_name, :last_name, :skype, :about, :free_questions, :ask_expert_id
  json.url profile_expert_url(profile_expert, format: :json)
end
