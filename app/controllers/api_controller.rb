class ApiController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :authenticate

  rescue_from Authorization::AuthorizationError, with: :user_not_authorized

  private

    # Also sets @authenticated_user for use elsewhere; since this step happens every action request, this can be used in place of a 'current_user' helper.
    def authenticate

      authenticate_or_request_with_http_token do |token, options|
        @authenticated_user = User.where(auth_token: token).first
      end
    end

    def user_not_authorized
      render json: "", status: :unauthorized
    end

end
