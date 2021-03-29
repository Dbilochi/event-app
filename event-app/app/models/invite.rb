class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  scope :accepted, -> { where(status: 'Accepted') }
  scope :not_accepted, -> { where.not(status: 'Accepted') }

  def as_json(options = {})
    super(
      only: [
        :email,
        :status
      ]
    ).merge(
      title: self.event.name,
      start: self.event.time,
      end: self.event.time + self.event.duration
    )
  end
end
