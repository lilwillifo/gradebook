class EnrollmentsController < ApplicationController
  def new
    @students = Student.all
  end

  def create
    student = Student.find(params[:student][:id])
    course = Course.find(params[:course_id])
    if Enrollment.find_by(course: course, student: student)
      flash[:message] = "#{student.name} is already enrolled."
      redirect_to new_course_enrollment_path
    else
      Enrollment.create(course: course, student: student)
      flash[:message] = "Added #{student.name} to #{course.title}"
      redirect_to course_path(params[:course_id])
    end
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
