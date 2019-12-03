class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :native_language, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :questions, dependent: :destroy
  has_many :answers 
  has_many :likes, dependent: :destroy 
  has_many :like_answers, through: :likes, source: :answer

  mount_uploader :avatar, AvatarUploader

  before_create :build_default_profile
  
  private

  def build_default_profile
    build_profile 
    true
  end

end
