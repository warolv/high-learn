class Student < User
  has_many :grades
  has_many :courses, through: :grades


  def self.highest_average_in_courses
    sql = "select student_id, FLOOR(avg(avg_grade)) as avg_all_courses_grade from (select student_id, course_id, avg(grade) as avg_grade from grades group by student_id, course_id) T group by student_id"
    res = ActiveRecord::Base.connection.exec_query(sql)
    res.to_hash.max_by{|k| k['avg_all_courses_grade'] }['student_id']
  end
end
