class Answer < ApplicationRecord
  belongs_to :user 
  belongs_to :question

  has_many :likes, dependent: :destroy 
  has_many :childs, class_name: 'Answer', foreign_key: :parent_answer_id

  acts_as_sequenced scope: :question_id
  
  validates :content, presence: true 
  
  def like_user(id)
    likes.find_by(user_id: id)
  end
end
