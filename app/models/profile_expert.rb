class ProfileExpert < ActiveRecord::Base
  belongs_to :ask_expert
  has_and_belongs_to_many :genres
  validates :free_questions, numericality: { greater_than_or_equal_to: 1 }
end
