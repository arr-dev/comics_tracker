class Library < ActiveRecord::Base
  belongs_to :user
  belongs_to :volume

  enum status: [ :active, :archived ]
end
