class Api::V1::GradesController < ApplicationController
  before_action :set_grade, only: [:show, :update, :destroy]

  def index
    @grades = Grade.all
    json_response(@grades)
  end

  def create
    if Grade.course_and_student_exists?(grade_params[:student_id], grade_params[:course_id])
      @grade = Grade.create!(grade_params)
      json_response(@grade, :created)
    else
      json_response({ message: 'create record - course and student with selected id must exist!' }, :unprocessable_entity)
    end
  end

  def show
    json_response(@grade)
  end

  def update
    if Grade.course_and_student_exists?(grade_params[:student_id], grade_params[:course_id])
      @grade.update(grade_params)
      head :no_content
    else
      json_response({ message: 'update record - course and student with selected id must exist!' }, :unprocessable_entity)
    end  
  end

  def destroy
    @grade.destroy
    head :no_content
  end
  
  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.permit(:grade, :student_id, :course_id)
  end
end
