class AddReportedToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :reported, :boolean, default: false
  end
end
