class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates :email, uniqueness: true

  def self.entities
    %w(Teacher Student)
  end
end
