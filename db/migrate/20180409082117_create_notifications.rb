class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :by
      t.references :to
      t.string :action
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
