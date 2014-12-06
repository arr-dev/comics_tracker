class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :comicvineid
      t.references :volume, index: true
      t.string :name
      t.string :issue_number
      t.date :store_date
      t.date :cover_date
      t.string :api_detail_url
      t.string :site_detail_url
      t.string :image_url
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
    add_foreign_key :issues, :volumes
  end
end
