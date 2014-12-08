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
#
# Indexes
#
#  index_libraries_on_user_id    (user_id)
#  index_libraries_on_volume_id  (volume_id)
#

class Library < ActiveRecord::Base
  belongs_to :user
  belongs_to :volume

  enum status: [ :active, :archived ]
end
