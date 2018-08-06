require 'rails_helper'

describe "Student views their dashboard" do
  scenario "and sees all their courses,grades, and cumulative GPA" do
    student = create(:student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)
    student = Student.find_by(user_id: student)
    teacher = create(:teacher)
    teacher = Teacher.find_by(user_id: teacher)
    semester = Semester.create!(session: 'fall', year: 2018)
    course = teacher.courses.create(title: 'Software Engineering', semester: semester)
    other_course = Course.create(title: 'Art History', teacher: teacher, semester: semester)
    Enrollment.create!(student: student, course: course, grade: 3.7)

    visit dashboard_path

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content(course.title)
    expect(page).to_not have_content(other_course.title)
    expect(page).to have_content(student.gpa)
  end
  scenario "student can sort by semester" do
    student = create(:student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)
    student = Student.find_by(user_id: student)
    teacher = create(:teacher)
    teacher = Teacher.find_by(user_id: teacher)
    semester_1 = Semester.create!(session: 'fall', year: 2018)
    semester_2 = Semester.create!(session: 'spring', year: 2018)
    course = teacher.courses.create(title: 'Software Engineering', semester: semester_1)
    other_course = Course.create(title: 'Art History', teacher: teacher, semester: semester_2)
    Enrollment.create!(student: student, course: course, grade: 3.7)

    visit dashboard_path
    expect(current_path).to eq("/dashboard")
    save_and_open_page

    click_on "spring 2018"

    expect(current_url).to include("/dashboard?semester=spring&2018")
    expect(page).to have_content(course.title)
    expect(page).to_not have_content(other_course.title)
  end
end
