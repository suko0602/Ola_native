class RemoveUserFromLanguage < ActiveRecord::Migration[5.2]
  def change
    remove_column :learning_languages, :user_id, :integer 

    add_column :users, :learning_language_id, :integer 
  end
end
