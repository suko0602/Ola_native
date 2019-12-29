class ProfileForm
  include ActiveModel::Model  
  include ActiveModel::Attributes

  attribute :id, :integer
  attribute :avatar, :binary 
  attribute :name, :string 
  attribute :native_language_id, :integer 
  attribute :learning_language_id, :integer 
  attribute :interest_country_id, :integer 
  attribute :well_known_country_id, :integer 
  attribute :introduction 

  validates :name, presence: true 

  def initialize(params = nil)
    self.id = params[:id]
    self.name = params[:name]
  end 

  def self.load(user_id)
    user = User.find(user_id)
    self.avatar = user.avatar 
    self.native_language_id = user.native_language_id
    self.learning_language_id = user.learning_language_id
    self.interest_country_id = user.interest_country_id
    self.well_known_country_id  = user.well_known_country_id
  end 

  def save 
    return false if invalid?

    ActiveRecord::Base.transaction do
      user = id.present? ? User.find(id) : User.new 
      user.attributes = { native_language_id: native_language_id, learning_language_id: learning_language_id,
         interest_country_id: interest_country_id, well_known_country_id: well_known_country_id }
      profile = user.profile.present? ? user.profile: user.profile_build
      profile.attirbutes = { name: name, introduction: introduction }
      user.save!
      profile.save!
    end

    true 
  rescue SystemError
    false
  end 

  def update(account_update_params)
  end

end 


     
