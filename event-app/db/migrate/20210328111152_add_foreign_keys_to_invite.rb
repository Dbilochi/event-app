class AddForeignKeysToInvite < ActiveRecord::Migration[6.0]
  def change
    add_reference :invites, :sender, references: :users, index: true
    add_reference :invites, :recipient, references: :users, index: true
    add_foreign_key :invites, :users, { :column => :sender_id }
    add_foreign_key :invites, :users, { :column => :recipient_id }
  end
end
