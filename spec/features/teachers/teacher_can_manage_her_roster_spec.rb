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
  # scenario "a teacher can remove a student from their roster" do
  #   user = create(:teacher)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #   teacher = Teacher.find_by(user_id: user)
  #   course = teacher.courses.create(title: 'Software Engineering')
  #   user_2 = create(:student)
  #   student = Student.find_by(user_id: user_2)
  #   Enrollment.create()
  #
  #   visit new_course_student_path(course)
  #
  #   select student.name, :from => "student_id"
  #   click_button "Add"
  #
  #   expect(current_path).to eq("/courses/#{course.id}")
  #   expect(page).to have_content("Added #{student.name} to #{course.title}")
  # end
end
