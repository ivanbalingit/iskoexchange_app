class AddVotesToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :upvote, :integer
    add_column :answers, :downvote, :integer
  end
end
