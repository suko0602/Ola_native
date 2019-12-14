class ProfileForm
  include ActiveModel::Model  
  include ActiveModel::Attirbutes

  attribute :id, :integer
  attribute :avatar, :binary 
  attribute :name, :string 
  attribute :native_language_id, :integer 
  attribute :learning_language_id, :integer 
  attribute :interest_country_id, :integer 
  attribute :well_known_country_id, :integer 
  attribute :introduction, :text 

  validates :name, presence: true 

  def save 
    return false if invalid?

    ActiveRecord::Transaction do
      user = id.present? ? User.find(1) : User.new 
      user.attributes = { name: name, introduction: introduction }

      profile = user.profile.present? ? user.profile: user.profile_build
      profile.attirbutes = { native_language_id: native_language_id, learning_language_id: learning_language_id, interest_country_id: interest_country_id, well_known_country_id: well_known_country_id }
      user.save!
      profile.save!
    end

    true 
  rescue SystemError
    return false
  end 
end 


     
