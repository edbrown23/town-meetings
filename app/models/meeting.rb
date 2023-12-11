# == Schema Information
#
# Table name: meetings
#
#  id            :integer          not null, primary key
#  title         :string
#  status        :text
#  recording_url :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Meeting < ApplicationRecord
end
