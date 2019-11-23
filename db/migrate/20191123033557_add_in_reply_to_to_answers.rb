class AddInReplyToToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :in_reply_to, :integer
  end
end
