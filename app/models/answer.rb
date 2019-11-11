class Answer < ApplicationRecord
  belongs_to :user 
  belongs_to :question
  has_many :reactions
  has_many :likes, dependent: :destroy 

  acts_as_sequenced scope: :question_id
  validates :content, presence: true 
  
  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end 

end
