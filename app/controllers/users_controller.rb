class UsersController < ApplicationController
  before_action :require_login, only: [:dashboard]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.username}"
      redirect_to '/dashboard'
    else
      redirect_to new_user_path
    end
  end

  def dashboard
    @semesters = Semester.all
  if params[:semester]
    semester = Semester.where(session: params[:semester].split('&')[0], year: params[:semester].split('&')[1] )
    @courses = Course.where(semester: semester)
    @enrollments = Enrollment.where(user: current_user, course: @courses)
  else
    @courses = Course.all
  end
  end

  private

  def user_params
    params.permit(:id, :username, :password_digest, :semester)
  end
end
