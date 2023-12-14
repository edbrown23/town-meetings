# == Schema Information
#
# Table name: transcribed_sections
#
#  id         :integer          not null, primary key
#  meeting_id :integer
#  order      :integer
#  seek       :integer
#  start      :integer
#  end        :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_transcribed_sections_on_meeting_id  (meeting_id)
#
class TranscribedSection < ApplicationRecord
  belongs_to :meeting
end
