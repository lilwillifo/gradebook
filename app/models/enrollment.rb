class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates_presence_of :grade
end
