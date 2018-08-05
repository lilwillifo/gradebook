require 'rails_helper'

describe "Teacher adds student to their course roster" do
  scenario "a teacher can add a student to their roster" do
    user = User.create(username: "test@fake.com", password: "VeRySeCuRe", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    course = Course.create(title: 'Software Engineering')

    visit new_course_student_path(course)

    fill_in "student[name]", with: "Margaret"
    click_button "Add"

    expect(current_path).to eq("/courses/#{course.id}")
    expect(page).to have_content("Margaret")
    expect(page).to have_content("Added Margaret to #{course.title}!")
  end
end
