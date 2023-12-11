class CreateMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.text :status
      t.text :recording_url

      t.timestamps
    end
  end
end
