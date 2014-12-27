# == Schema Information
#
# Table name: libraries
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  volume_id  :integer
#  status     :integer          default("0")
#  created_at :datetime
#  updated_at :datetime
#  last_read  :integer
#
# Indexes
#
#  index_libraries_on_last_read  (last_read)
#  index_libraries_on_user_id    (user_id)
#  index_libraries_on_volume_id  (volume_id)
#

class Library < ActiveRecord::Base
  belongs_to :user
  belongs_to :volume

  validates :user, :volume, presence: true

  enum status: [ :active, :archived ]

  def next_read(issue)
    if last_read.nil? || issue.issue_number > last_read
      update_attributes!(last_read: issue.issue_number)
    end
  end

  def previous_read(user, issue)
    previous_issue = user.readlists.for_volume(issue.volume).first.try(:issue)
    previous_issue &&= previous_issue.issue_number
    update_attributes!(last_read: previous_issue)
  end
end
