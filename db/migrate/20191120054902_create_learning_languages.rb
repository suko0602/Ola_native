class CreateLearningLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_languages do |t|
      t.string :name
      t.integer :level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
