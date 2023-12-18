# == Schema Information
#
# Table name: meetings
#
#  id                :integer          not null, primary key
#  title             :string
#  status            :text
#  recording_url     :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  local_meeting_url :string
#
class Meeting < ApplicationRecord
  has_many :transcribed_sections
  has_one :meeting_summary
end
