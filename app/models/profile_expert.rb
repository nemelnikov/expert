class ProfileExpert < ActiveRecord::Base
  belongs_to :ask_expert
  has_and_belongs_to_many :genres
end
