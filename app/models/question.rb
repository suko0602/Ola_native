class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :title, presence: true
  validates :body, presence: true 
end
