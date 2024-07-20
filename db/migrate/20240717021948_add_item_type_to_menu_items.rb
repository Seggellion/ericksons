class AddItemTypeToMenuItems < ActiveRecord::Migration[7.1]
  def change
    add_column :menu_items, :item_type, :integer
    add_column :menu_items, :item_id, :integer
    add_column :pages, :meta_description, :text
    add_column :pages, :meta_keywords, :text
    add_column :media, :meta_description, :text
    add_column :media, :meta_keywords, :text
    add_column :services, :meta_description, :text
    add_column :services, :meta_keywords, :text
    add_column :posts, :meta_description, :text
    add_column :posts, :meta_keywords, :text
    add_column :articles, :meta_description, :text
    add_column :articles, :meta_keywords, :text
  end
end
