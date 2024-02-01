class ChangeQuestionsToQuestion < ActiveRecord::Migration[7.0]
  def change
    rename_table :questions, :question
  end
end
