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
    it '.gpa returns cumulative gpa by semester' do
      user = create(:student)
      user_2 = create(:teacher)
      teacher = Teacher.find_by(user_id: user_2)
      semester = Semester.create(session: 'fall', year: 2018)
      semester_2 = Semester.create(session: 'fall', year: 2018)
      course_1 = teacher.courses.create(title: 'Course 1', semester: semester)
      course_2 = teacher.courses.create(title: 'Course 2', semester: semester)
      course_3 = teacher.courses.create(title: 'Course 3', semester: semester_2)
      Enrollment.create(course: course_1, student: user.student, grade: 2.5)
      Enrollment.create(course: course_2, student: user.student, grade: 3.0)
      Enrollment.create(course: course_3, student: user.student, grade: 3.5)

      expect(user.student.gpa(semester)).to eq(2.75)
      expect(user.student.gpa(semester_2)).to eq(3.5)
    end
  end
end
