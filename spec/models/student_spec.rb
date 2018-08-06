require 'rails_helper'

describe Student, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
  end
  context 'relationships' do
    it { should have_many :enrollments }
    it { should have_many :courses }
  end
  context 'instance methods' do
    it '.gpa returns cumulative gpa' do
      user = create(:student)
      user_2 = create(:teacher)
      teacher = Teacher.find_by(user_id: user_2)
      course_1 = teacher.courses.create(title: 'Course 1')
      course_2 = teacher.courses.create(title: 'Course 2')
      course_3 = teacher.courses.create(title: 'Course 3')
      Enrollment.create(course: course_1, student: user.student, grade: 2.5)
      Enrollment.create(course: course_2, student: user.student, grade: 3.0)
      Enrollment.create(course: course_3, student: user.student, grade: 3.5)

      expect(user.student.gpa).to eq(3.0)
    end
  end
end
