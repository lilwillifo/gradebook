class Course < ApplicationRecord
  validates_presence_of :title
  belongs_to :teacher
  belongs_to :semester
  has_many :enrollments
  has_many :students, through: :enrollments

  def average_grade
    enrollments.average(:grade)
  end

  def enrollment_count
    enrollments.length
  end
end
