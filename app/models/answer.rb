class Answer < ApplicationRecord
  belongs_to :user 
  belongs_to :question

  has_many :likes, dependent: :destroy 
  has_many :like_users, through: :likes, source: :user 
  has_many :childs, class_name: 'Answer', foreign_key: :parent_answer_id

  acts_as_sequenced scope: :question_id
  
  validates :content, presence: true 
  
  def like?(user)
    like_users.include?(user)
  end
end
