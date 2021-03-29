class Api::V1::EventsController < Api::V1::AuthController
  before_action :set_user, except: [:update_invitations]

  def user_events
    if @user
      render json: { data: @user.invitations.accepted.as_json }, status: :ok
    else
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  def user_invitations
    if @user
      render json: { data: @user.invitations.as_json }, status: :ok
    else
      render json: { errors: 'User not found' }, status: :not_found
    end
  end

  def update_invitations
    @invite = Invite.find_by(id: params[:id])
    if @invite
      @invite.update(status: params[:status])
      render json: { data: @user.invitations.as_json }, status: :ok
    else
      render json: { errors: 'Invite not found' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
