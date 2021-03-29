class Api::V1::EventsController < Api::V1::AuthController
  before_action :set_user

  def user_events
    if @user
      render json: { data: @user.invitations.accepted.as_json }, status: :ok
    else
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  def user_invitations
    if @user
      p '@user.invitations.not_accepted.as_json--', @user.invitations.not_accepted
      render json: { data: @user.invitations.not_accepted.as_json }, status: :ok
    else
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
