# rubocop:disable Metrics/LineLength
class IssueNumberToIntegerAndIndex < ActiveRecord::Migration
  def up
    change_column :issues, :issue_number, 'integer USING CAST("issue_number" AS integer)'
    add_index :issues, :issue_number
  end

  def down
    remove_index :issues, :issue_number
    change_column :issues, :issue_number, :string
  end
end
