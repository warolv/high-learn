FactoryBot.define do
  factory :grade do
    grade { Faker::Number.number(2) }
    student_id { '1' }
    course_id { '1' }
  end
end