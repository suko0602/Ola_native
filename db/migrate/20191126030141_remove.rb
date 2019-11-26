class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :native_languages, :user_id 

    add_column :profiles, :language_id, :string 
  end
end
