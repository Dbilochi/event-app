class AddEventIdToInvite < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :event_id, :integer
  end
end
