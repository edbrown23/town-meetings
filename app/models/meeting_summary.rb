# == Schema Information
#
# Table name: meeting_summaries
#
#  id         :integer          not null, primary key
#  meeting_id :integer
#  full_text  :string
#  summary    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_meeting_summaries_on_meeting_id  (meeting_id)
#
class MeetingSummary < ApplicationRecord
  belongs_to :meeting
end
