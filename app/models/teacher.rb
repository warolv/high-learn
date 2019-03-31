class Teacher < User
  has_many :courses

  def self.get_teacher_id_with_max_number_of_students
    sql = "select u.id, count(distinct(student_id)) as distinct_students_cnt from users u join courses c on (u.id = c.teacher_id) join grades g on (c.id = g.course_id) group by u.id"
    res = ActiveRecord::Base.connection.exec_query(sql)
    res.to_hash.max_by{|k| k['distinct_students_cnt'] }['id']
  end
end