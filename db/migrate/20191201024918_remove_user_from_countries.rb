class RemoveUserFromCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :interest_countries, :user_id, :integer 
    remove_column :well_known_countries, :user_id, :integer 

    add_column :users, :interest_country_id, :integer 
    add_column :users, :well_known_countries_id, :integer 
  end
end
