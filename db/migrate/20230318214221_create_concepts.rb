class CreateConcepts < ActiveRecord::Migration[7.0]
  def change
    create_table :concepts do |t|
      t.references :subject_matter, null: false, foreign_key: true
      t.string :name
      t.string :concept_prompt
      t.text :notes

      t.timestamps
    end
  end
end
