class Issue < ActiveRecord::Base
  belongs_to :volume

  enum status: [ :active, :archived ]

  def self.create_from_api(results)
    volume = Volume.find_by_comicvineid(results['volume']['id'])

    create!(
      comicvineid: results['id'],
      volume: volume,
      name: results['name'],
      issue_number: results['issue_number'],
      store_date: results['store_date'],
      cover_date: results['cover_date'],
      api_detail_url: results['api_detail_url'],
      site_detail_url: results['site_detail_url'],
      image_url: 'http://static.comicvine.com' + results['image']['medium_url'],
      description: results['description'],
    )
  end
end
