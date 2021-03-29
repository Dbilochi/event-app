class ChangeTypeOfDurationInEvent < ActiveRecord::Migration[6.0]
  def down
    change_column :events, :duration, :time
  end

  def up
    change_column :events, :duration, :string
  end
end
