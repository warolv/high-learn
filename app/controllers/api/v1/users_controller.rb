class Api::V1::UsersController < ApplicationController
  before_action :set_entity
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = entity_class.all
    json_response(@users)
  end

  def create
    @user = entity_class.create!(user_params)
    json_response(@user, :created)
  end

  def show
    json_response(@user)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email)
  end

  def set_user
    @user = entity_class.find(params[:id])
  end

  def set_entity 
    @entity = entity 
  end

  def entity 
    User.entities.include?(params[:type].capitalize) ? params[:type].capitalize : "User"
  end

  def entity_class 
    entity.constantize 
  end
end
