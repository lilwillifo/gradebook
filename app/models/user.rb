class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  after_create :add_teacher_or_student
  has_one :teacher
  has_one :student

  has_secure_password

  enum role: %w[student teacher admin]

  def add_teacher_or_student
    if role == 'student'
      Student.create(name: self.username, user_id: self.id)
    elsif role == 'teacher'
      Teacher.create(name: self.username, user_id: self.id)
    end
  end

end
