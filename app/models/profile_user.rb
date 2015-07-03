class ProfileUser < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy#Might want to change this later
end
