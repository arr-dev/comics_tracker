class IssueNumberToIntegerAndIndex < ActiveRecord::Migration
  def up
    change_column :issues, :issue_number, :integer
    add_index :issues, :issue_number
  end

  def down
    remove_index :issues, :issue_number
    change_column :issues, :issue_number, :string
  end
end
