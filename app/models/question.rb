class Question < ActiveRecord::Base
  belongs_to :profile_user
  belongs_to :profile_expert
  belongs_to :genre
end
