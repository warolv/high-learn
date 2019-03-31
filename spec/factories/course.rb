FactoryBot.define do
  factory :course do
    name { Faker::Lorem.word }
    teacher_id { '1' }
  end
end