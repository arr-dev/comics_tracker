# == Schema Information
#
# Table name: issues
#
#  id              :integer          not null, primary key
#  comicvineid     :integer
#  volume_id       :integer
#  name            :string
#  issue_number    :integer
#  store_date      :date
#  cover_date      :date
#  api_detail_url  :string
#  site_detail_url :string
#  image_url       :string
#  description     :text
#  status          :integer          default("0")
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_issues_on_comicvineid   (comicvineid)
#  index_issues_on_issue_number  (issue_number)
#  index_issues_on_volume_id     (volume_id)
#

class Issue < ActiveRecord::Base
  default_scope -> { order(issue_number: :desc) }
  scope :newest, -> { order(issue_number: :desc) }

  has_many :readlists
  belongs_to :volume

  validates :comicvineid, :volume, :issue_number, :store_date, :image_url, presence: true

  enum status: [ :active, :archived ]

  def self.create_from_api(results)
    volume = Volume.find_by_comicvineid(results['volume']['id'])

    raise "Issue number is: #{results['issue_number']} #{results['issue_number'].class}" if results['issue_number'].to_i.to_s != results['issue_number']
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
