class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :doorkeeper_authorize!, :if => proc {Rails.env.production?}
end

