class EnrollmentsController < ApplicationController
  def new
  end

  def create
    student = Student.find(params[:student][:id])
    course = Course.find(params[:course_id])
    Enrollment.create(course: course, student: student)

    flash[:message] = "Added #{student.name} to #{course.title}"
    redirect_to course_path(params[:course_id])
  end
end
