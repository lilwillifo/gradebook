class Student < ApplicationRecord
  validates_presence_of :name
  has_many :enrollments
  has_many :courses, through: :enrollments

  def gpa
    enrollments.average(:grade)
  end
end
