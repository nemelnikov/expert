class Question < ActiveRecord::Base
  QUESTION_TYPES=["Free","Standard","Premium"]#Type of question given

  belongs_to :profile_user
  belongs_to :profile_expert
  belongs_to :genre
  has_many :messages
  
  validates :title,:question_description, presence: true
  validates :question_type, inclusion: QUESTION_TYPES#Make sure that question type is one of the given types

end
