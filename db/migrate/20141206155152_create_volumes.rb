class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.integer :comicvineid, index: true
      t.string :name
      t.integer :start_year
      t.string :api_detail_url
      t.string :site_detail_url
      t.string :image_url
      t.string :publisher_name
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
