class Student < User
  has_many :grades
  has_many :courses, through: :grades
end