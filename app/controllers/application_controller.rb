class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :doorkeeper_authorize!
end

