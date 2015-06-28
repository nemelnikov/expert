class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile_user, dependent: :destroy
  after_create :build_profile_user


  #After creating a new user we need to create the table that connects people with the newly created user.
 # def createProfileUser 
  #	new_record = ProfileUser.new(user_id: self.id)
 # 	new_record.save!
 # end

 def isAdmin?
 	if profile_user.nil?#If guest user
 		false
 	else
 		profile_user.admin?#Logged in user is admin?
 	end
 end

 def isGuest? #Check if the current user is Guest, Will be helpful later
 	profile_user.nil?#A guest will not have a connected profile to his name
 					 #True if guest user, false otherwise
 end

end
