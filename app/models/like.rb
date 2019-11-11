class Like < ApplicationRecord
  belong_to :user
  belong_to :answer 
  validates :user_id, presence: true 
  validates :answer_id, presence: true 
end
