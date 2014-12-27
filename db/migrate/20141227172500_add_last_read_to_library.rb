class AddLastReadToLibrary < ActiveRecord::Migration
  def change
    change_table :libraries do |t|
      t.integer :last_read
    end
    add_index :libraries, :last_read
  end
end
