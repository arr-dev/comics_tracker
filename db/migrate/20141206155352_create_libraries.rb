class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :user, index: true
      t.references :volume, index: true
      t.integer :status, default: 0

      t.timestamps
    end
    add_foreign_key :libraries, :users
    add_foreign_key :libraries, :volumes
  end
end
