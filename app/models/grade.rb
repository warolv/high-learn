class Grade < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates_presence_of :grade
end
