class AddLocalMeetingUrl < ActiveRecord::Migration[7.1]
  def change
    add_column :meetings, :local_meeting_url, :string
  end
end
