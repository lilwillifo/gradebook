require 'rails_helper'

describe Course, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
  end
  context 'relationships' do
    it { should belong_to :teacher }
    it { should belong_to :semester }
    it { should have_many :enrollments }
    it { should have_many :students }
  end
  context 'instance methods' do
    it '.average_grade' do
      teacher = create(:teacher)
      semester = Semester.create(session: 'fall', year: 2018)
      course = teacher.teacher.courses.create(title: 'Software Engineering', semester: semester)
      student = create(:student)
      student_2 = create(:student)
      Enrollment.create(student: student.student, course: course, grade: 4.0)
      Enrollment.create(student: student_2.student, course: course, grade: 3.5)

      expect(course.average_grade).to eq(3.75)
    end
    it '.enrollment_count' do
      teacher = create(:teacher)
      semester = Semester.create(session: 'fall', year: 2018)
      course = teacher.teacher.courses.create(title: 'Software Engineering', semester: semester)
      student = create(:student)
      student_2 = create(:student)
      Enrollment.create(student: student.student, course: course, grade: 4.0)
      Enrollment.create(student: student_2.student, course: course, grade: 3.5)

      expect(course.enrollment_count).to eq(2)
    end
  end
end
