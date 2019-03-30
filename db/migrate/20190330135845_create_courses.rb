class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :teacher_id, foreign_key: true

      t.timestamps
    end

    add_index :courses, :name
    add_index :courses, :teacher_id
  end
end
