class Student < ApplicationRecord
  validates_presence_of :name
  has_many :enrollments
  has_many :courses, through: :enrollments

  def gpa(semester)
    enrollments.where(course: courses.where(semester: semester) ).average(:grade)
  end
end
