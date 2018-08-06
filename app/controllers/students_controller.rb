class StudentsController < ApplicationController
  def new
  end

  def create
    student = Student.find(params[:student][:id])
    course = Course.find(params[:course_id])
    flash[:message] = "Added #{student.name} to #{course.title}"
    redirect_to course_path(params[:course_id])
  end
end
