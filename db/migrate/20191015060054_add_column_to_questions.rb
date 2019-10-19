class AddColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :title, :string
    add_column :questions, :body, :text
  end
end
