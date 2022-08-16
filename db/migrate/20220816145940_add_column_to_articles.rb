class AddColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :date, :datetime
    add_column :articles, :deadline, :datetime
  end
end
