class CreateConversationItems < ActiveRecord::Migration[8.1]
  def change
    create_table :conversation_items do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.text :body
      t.string :from_status
      t.string :to_status

      t.timestamps
    end
  end
end
