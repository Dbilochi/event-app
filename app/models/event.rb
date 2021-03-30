class Event < ApplicationRecord
  attribute :duration, :duration
  has_many :invites
  has_many :users_events, dependent: :destroy
  has_many :users, through: :users_events
end
