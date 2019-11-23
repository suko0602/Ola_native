class CreateNativeLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :native_languages do |t|
      t.string :name
      t.integer :level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
