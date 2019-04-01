module API
  module TokenAuthentication
    def valid_token?
      request.authorization.present? && ApiToken.exists?(request.authorization, :env => Rails.env)
    end
  end
end