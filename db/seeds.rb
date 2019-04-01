require 'faker'

5.times do 
  t = Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  s = Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  c = Course.create(name: Faker::Lorem.word, teacher_id: t.id)
  5.times do
    Grade.create(grade: Faker::Number.number(2), student_id: s.id, course_id: c.id)
  end
end

# Token for Demo purposes
ApiToken.create(token: '08ede18ff7aa239d0259a989ae765ebc04ca91b8', env: 'development')


