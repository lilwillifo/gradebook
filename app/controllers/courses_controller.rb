class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end

  def update
    student = Student.find(params[:student][:id])
    course = Course.find(params[:id])
    enrollment = Enrollment.find_by(course: course, student: student)
    enrollment.delete

    flash[:message] = "Removed #{student.name} from #{course.title}"
    redirect_to course_path(params[:id])
  end

end
