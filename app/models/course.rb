class Course < ApplicationRecord
  has_many :grades
  has_many :students, through: :grades
  belongs_to :teacher
  
  validates :name, uniqueness: true, presence: true
  validates :teacher_id, presence: true

  def self.teacher_exists?(teacher_id)
    teacher_id.present? && Teacher.exists?(teacher_id)
  end

  def self.get_easiest_course
    sql = "select course_id, FLOOR(avg(grade)) as avg_course from grades group by course_id"
    res = ActiveRecord::Base.connection.exec_query(sql)
    res.to_hash.max_by{|k| k['avg_course'] }['course_id']
  end
end
