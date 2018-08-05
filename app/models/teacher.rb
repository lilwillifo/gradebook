class Teacher < ApplicationRecord
  validates_presence_of :name
  has_many :courses
end
