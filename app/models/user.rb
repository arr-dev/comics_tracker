class User < ActiveRecord::Base
  has_many :libraries
  has_many :volumes, through: :libraries
  has_many :readlists
  has_many :issues, through: :readlists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :trackable, :validatable,
         :confirmable

  def has_volume?(volume)
    volumes.include?(volume)
  end
end
