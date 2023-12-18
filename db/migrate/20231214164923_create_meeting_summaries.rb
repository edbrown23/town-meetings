class CreateMeetingSummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :meeting_summaries do |t|
      t.references :meeting
      t.string :full_text
      t.string :summary

      t.timestamps
    end
  end
end
