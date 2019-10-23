class Answer < ApplicationRecord
  belongs_to :user 
  belongs_to :question
  has_many :reactions

  acts_as_sequenced scope: :question_id
  validates :content, presence: true 
end
