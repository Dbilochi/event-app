class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/

  has_many :user_events, dependent: :destroy
  has_many :invitations, class_name: "Invite", foreign_key: 'recipient_id'
  has_many :sent_invites, class_name: "Invite", foreign_key: 'sender_id'
  has_many :events, through: :user_events, dependent: :destroy
end
