class CreateSubjectMatters < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_matters do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
