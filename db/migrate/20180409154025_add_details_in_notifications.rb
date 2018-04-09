class AddDetailsInNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :details, :string
  end
end
