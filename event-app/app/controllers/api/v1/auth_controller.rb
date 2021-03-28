class Api::V1::AuthController < ApplicationController
  before_action :authorize_request, except: [:login]

  def authorize_request
    begin
      current_user
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      render json: { token: encoded_auth_token,
                     username: @user.name, user_id: @user.id
      }
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def current_user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def encoded_auth_token
    JsonWebToken.encode(user_id: @user.id)
  end

  def http_auth_header
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?
  end
end
