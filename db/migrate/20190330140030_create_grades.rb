class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :grade
      t.references :course, foreign_key: true
      t.integer :student_id, foreign_key: true

      t.timestamps
    end
    
    add_index :grades, :grade
    add_index :grades, :student_id
  end
end
