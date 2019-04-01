class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include API::TokenAuthentication

  before_action :authorize_request!, if: -> {!(Rails.env.test?)}

  private

  def authorize_request!
    if !valid_token?
      json_response({ message: '401 Unauthorized' }, :forbidden)
    end
  end
end

