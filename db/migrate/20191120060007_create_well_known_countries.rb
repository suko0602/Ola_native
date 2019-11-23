class CreateWellKnownCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :well_known_countries do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
