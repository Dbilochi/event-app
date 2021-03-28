class AddDefaultStatusToInvite < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :status, :string, default: "Pending"
  end
end
