class Grade < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates_presence_of :grade, :student_id, :course_id
  validates_inclusion_of :grade, :in => 0..100

  def self.course_and_student_exists?(student_id, course_id)
    (student_id.present? && Student.exists?(student_id)) && (course_id.present? && Course.exists?(course_id))
  end
end
