class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  # before_action :authenticate_request
  before_action :authenticate_user
  attr_reader :current_user

  private

  def unauthorized
    render json: { error: 'User not authenticated.' }, status: :unauthorized
  end

  def authenticate_user
    token = request.headers['Authentication-Token']
    return unauthorized unless User.exists?(authentication_token: token)
  end
end
