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
end
