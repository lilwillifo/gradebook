require 'rails_helper'

describe "Student views their dashboard" do
  scenario "and sees all their courses,grades, and cumulative GPA" do
    student = create(:student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)
    student = Student.find_by(user_id: student)
    teacher = create(:teacher)
    teacher = Teacher.find_by(user_id: teacher)
    course = teacher.courses.create(title: 'Software Engineering')
    other_course = Course.create(title: 'Art History')
    Enrollment.create!(student: student, course: course, grade: 3.7)

    visit dashboard_path

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content(course.title)
    expect(page).to_not have_content(other_course.title)
    expect(page).to have_content(student.gpa)
  end
  scenario "and teachers cannot see all courses a student is registered for" do

  end
end
