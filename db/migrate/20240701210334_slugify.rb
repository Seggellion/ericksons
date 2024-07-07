class Slugify < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :slug, :string
    add_column :services, :slug, :string
    add_column :articles, :slug, :string
    add_column :categories, :slug, :string
  end
end
