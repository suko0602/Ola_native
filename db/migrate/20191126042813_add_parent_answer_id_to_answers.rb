class AddParentAnswerIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :parent_answer_id, :integer
  end
end
