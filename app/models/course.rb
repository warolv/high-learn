class Course < ApplicationRecord
  has_many :grades
  has_many :students, through: :grades
  belongs_to :teacher
  
  validates :name, uniqueness: true, presence: true
end
