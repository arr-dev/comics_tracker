class Volume < ActiveRecord::Base
  has_many :issues

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
