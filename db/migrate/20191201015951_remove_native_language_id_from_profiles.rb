class RemoveNativeLanguageIdFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :native_language_id, :integer 
  end
end
