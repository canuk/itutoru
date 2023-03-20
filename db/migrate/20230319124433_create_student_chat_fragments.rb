class CreateStudentChatFragments < ActiveRecord::Migration[7.0]
  def change
    create_table :student_chat_fragments do |t|
      t.string :response_type
      t.text :chat_text
      t.string :student_response
      t.timestamps
    end
  end
end
