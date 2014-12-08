# == Schema Information
#
# Table name: volumes
#
#  id              :integer          not null, primary key
#  comicvineid     :integer
#  name            :string
#  start_year      :integer
#  api_detail_url  :string
#  site_detail_url :string
#  image_url       :string
#  publisher_name  :string
#  description     :text
#  status          :integer          default("0")
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_volumes_on_comicvineid  (comicvineid)
#

class Volume < ActiveRecord::Base
  has_many :issues
  has_many :libraries

  enum status: [ :active, :archived ]

  def self.create_from_api(results)
    create!(
      comicvineid: results['id'],
      name: results['name'],
      start_year: results['start_year'],
      api_detail_url: results['api_detail_url'],
      site_detail_url: results['site_detail_url'],
      image_url: 'http://static.comicvine.com' + results['image']['medium_url'],
      publisher_name: results['publisher']['name'],
      description: results['description'],
    )
  end
end
