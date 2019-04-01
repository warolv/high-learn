class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request!, if: -> {!(Rails.env.test?)}

  private

  def authorize_request!
    if !request.authorization.present? || !ApiToken.exists?(token: request.authorization, env: Rails.env)
      json_response({ message: '401 Unauthorized' }, :unauthorized)
    end
  end
end

