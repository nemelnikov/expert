class Genre < ActiveRecord::Base
	has_and_belongs_to_many :profile_expert
end
