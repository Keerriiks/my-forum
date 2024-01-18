class CreateChatBots < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_bots do |t|

      t.timestamps
    end
  end
end
