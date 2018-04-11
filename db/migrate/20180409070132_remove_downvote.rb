class RemoveDownvote < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :downvote
  end
end
