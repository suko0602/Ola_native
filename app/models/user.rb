class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers 
  has_many :likes, dependent: :destroy 
  has_many :like_answers, through: :likes, source: :answer

  belongs_to :native_language, optional: true 
  belongs_to :learning_language, optional: true 
  belongs_to :interest_country, optional: true 
  belongs_to :well_known_country, optional: true 

  mount_uploader :avatar, AvatarUploader

  before_create :build_profile

end
