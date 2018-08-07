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

  def edit
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find(params[:id])
    @student = Student.find(@enrollment.student_id)
  end

  def update
    enrollment = Enrollment.find(params[:id])
    enrollment.grade = params[:grade]
    enrollment.save
    course = Course.find(params[:course_id])
    redirect_to course_path(course)
  end
end
