class AddNativeLanguageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :native_language_id, :integer 
  end
end
