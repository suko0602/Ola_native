class RemoveNativeLangiageIdFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :native_langiage_id, :integer 
  end
end
