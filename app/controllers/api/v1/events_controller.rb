class Api::V1::EventsController < Api::V1::AuthController
  before_action :set_user, only: [:user_events, :user_invitations]
  before_action :set_event, only: [:show, :update, :destroy]

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

  def index
    @events = Event.all

    render json: @events
  end

  def show
    render json: @event
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :time, :duration)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
