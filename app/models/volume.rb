class Volume < ActiveRecord::Base
  has_many :issues

  enum status: [ :active, :archived ]
end
