class Semester < ApplicationRecord
  validates_presence_of :session
  validates_presence_of :year
  enum session: %w[fall spring summer]
end
