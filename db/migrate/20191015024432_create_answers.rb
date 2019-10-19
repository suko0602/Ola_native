class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true, null: false
      t.integer :sequential_id, null: false

      t.timestamps null: false 
    end

    add_index :answers, [:question_id, :sequential_id], unique: true
  end
end
