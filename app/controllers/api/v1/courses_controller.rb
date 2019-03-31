class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]
  
  def index
    @courses = Course.all
    json_response(@courses)
  end

  def create
    if Course.teacher_exists?(course_params[:teacher_id])
      @course = Course.create!(course_params)
      json_response(@course, :created)
    else
      json_response({ message: 'create record - teacher with this id not exists' }, :unprocessable_entity)
    end
  end

  def show
    json_response(@course)
  end

  def update
    if Course.teacher_exists?(course_params[:teacher_id])
      @course.update(course_params)
      head :no_content
    else
      json_response({ message: 'update record - teacher with this id not exists' }, :unprocessable_entity)
    end
  end

  def destroy
    @course.destroy
    head :no_content
  end

  def easiest
    @course = Course.find(Course.get_easiest_course)
    json_response(@course)
  end
  
  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.permit(:name, :teacher_id)
  end
end
