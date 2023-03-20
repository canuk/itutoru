class CreateStudentChats < ActiveRecord::Migration[7.0]
  def change
    create_table :student_chats do |t|
      t.references :concept, null: false, foreign_key: true

      t.timestamps
    end
  end
end
