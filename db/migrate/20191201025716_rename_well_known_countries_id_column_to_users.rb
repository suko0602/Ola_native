class RenameWellKnownCountriesIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :well_known_countries_id, :well_known_country_id 
  end
end
