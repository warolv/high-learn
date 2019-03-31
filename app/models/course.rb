class Course < ApplicationRecord
  has_many :grades
  has_many :students, through: :grades
  belongs_to :teacher
  
  validates :name, uniqueness: true, presence: true
  validates :teacher_id, presence: true

  def self.teacher_exists?(teacher_id)
    teacher_id.present? && Teacher.exists?(teacher_id)
  end
end
