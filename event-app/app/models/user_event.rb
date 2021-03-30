class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :create_invite

  def create_invite
    Invite.create(sender_id: user.id, recipient_id: user.id, email: user.email, event_id: event.id)
  end
end
