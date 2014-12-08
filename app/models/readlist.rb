# == Schema Information
#
# Table name: readlists
#
#  id         :integer          not null, primary key
#  issue_id   :integer
#  user_id    :integer
#  read       :boolean
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_readlists_on_issue_id  (issue_id)
#  index_readlists_on_user_id   (user_id)
#

class Readlist < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user

  validates :issue, :user, presence: true
end
