class Course < ApplicationRecord
  validates_presence_of :title
  belongs_to :teacher
end
