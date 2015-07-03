class Message < ActiveRecord::Base
  belongs_to :question

  validates :message_body, presence: true,length: {minimum: 20}#Minimum length must be 20 characters
end
