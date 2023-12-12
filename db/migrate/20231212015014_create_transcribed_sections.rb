class CreateTranscribedSections < ActiveRecord::Migration[7.1]
  def change
    create_table :transcribed_sections do |t|
      t.references :meeting
      t.integer :order
      t.integer :seek
      t.integer :start
      t.integer :end
      t.string :text

      t.timestamps
    end
  end
end
