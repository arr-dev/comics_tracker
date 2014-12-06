class Issue < ActiveRecord::Base
  belongs_to :volume

  enum status: [ :active, :archived ]
end
