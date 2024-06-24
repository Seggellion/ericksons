class ChangeContentInArticles < ActiveRecord::Migration[7.1]
  def change
    change_column_null :articles, :content, true
  end
end
