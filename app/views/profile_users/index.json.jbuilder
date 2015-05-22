json.array!(@profile_users) do |profile_user|
  json.extract! profile_user, :id, :user_id, :first_name, :last_name, :skype, :admin
  json.url profile_user_url(profile_user, format: :json)
end
