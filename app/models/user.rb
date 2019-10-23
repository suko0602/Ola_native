class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  before_create :build_default_profile
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions 
  has_many :answers 

  private
  def build_default_profile
    build_profile 
    true
  end
end
