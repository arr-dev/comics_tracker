class CreateReadlists < ActiveRecord::Migration
  def change
    create_table :readlists do |t|
      t.references :issue, index: true
      t.references :user, index: true
      t.boolean :read

      t.timestamps
    end
    add_foreign_key :readlists, :issues
    add_foreign_key :readlists, :users
  end
end
