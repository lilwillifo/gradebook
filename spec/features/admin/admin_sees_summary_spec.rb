require 'rails_helper'

describe "Student views their dashboard" do
  scenario "and sees all their courses,grades, and cumulative GPA" do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    students = create_list(:student, 5)
    students.map! do |student|
      Student.find_by(user_id: student)
    end
    teacher = create(:teacher)
    teacher = Teacher.find_by(user_id: teacher)
    course = teacher.courses.create(title: 'Software Engineering')
    students.each do |student|
      Enrollment.create!(student: student, course: course, grade: rand(1..4))
    end
    visit dashboard_path

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content(course.average_grade)
    expect(page).to have_content(course.enrollment_count)
  end
end
