class ChangeDefaultValuesOfVotes < ActiveRecord::Migration[5.1]
  def change
    change_column_default :answers, :upvote, from: nil, default: 0
    change_column_default :answers, :downvote, from: nil, default: 0
  end
end
