class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :native_languages, :user_id, :integer

    add_column :profiles, :native_language_id, :integer 
  end
end
