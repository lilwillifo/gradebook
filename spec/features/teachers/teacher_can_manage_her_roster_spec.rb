require 'rails_helper'

describe "Teacher manages their course roster" do
  scenario "a teacher can add a student to their roster" do
    user = create(:teacher)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    teacher = Teacher.find_by(user_id: user)
    course = teacher.courses.create(title: 'Software Engineering')
    user_2 = create(:student)
    student = Student.find_by(user_id: user_2)

    visit new_course_enrollment_path(course)

    select student.name, :from => "student_id"
    click_button "Add"

    expect(current_path).to eq("/courses/#{course.id}")
    expect(page).to have_content("Added #{student.name} to #{course.title}")
    expect(student.courses).to eq([course])
    expect(course.students).to eq([student])
  end
  scenario "a teacher can remove a student from their roster" do
    user = create(:teacher)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    teacher = Teacher.find_by(user_id: user)
    course = teacher.courses.create(title: 'Software Engineering')
    user_2 = create(:student)
    student = Student.find_by(user_id: user_2)
    Enrollment.create!(student: student, course: course)

    visit course_path(course)

    select student.name, :from => "student_id"
    click_button "Remove"

    expect(current_path).to eq("/courses/#{course.id}")
    expect(page).to have_content("Removed #{student.name} from #{course.title}")
    expect(student.courses).to eq([])
    expect(course.students).to eq([])
  end
  scenario "a teacher sees all students in their course and their grades" do
    user = create(:teacher)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    teacher = Teacher.find_by(user_id: user)
    course = teacher.courses.create(title: 'Software Engineering')
    enrolled_students = create_list(:student, 10)
    not_enrolled = create_list(:student, 5)
    enrolled_students.each do |user|
      Enrollment.create!(student: user.student, course: course, grade: rand(0..4))
    end

    visit course_path(course)

    expect(page).to have_css('.student', count: 10)
    enrolled_students.sort.each do |student|
      expect(page).to have_content(student.username)
      expect(page).to have_content(student.student.enrollments.first.grade)
    end
    not_enrolled.each do |student|
      expect(page).to_not have_content(student.username)
    end
  end

  scenario 'a student cannot see other students grades' do
    user = create(:student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    teacher = create(:teacher)
    teacher = Teacher.find_by(user_id: teacher)
    course = teacher.courses.create(title: 'Software Engineering')
    enrolled_students = create_list(:student, 10)
    not_enrolled = create_list(:student, 5)
    enrolled_students.each do |user|
      Enrollment.create!(student: user.student, course: course, grade: rand(0..4))
    end

    visit course_path(course)

    expect(current_path).to eq(dashboard_path)
  end
end
