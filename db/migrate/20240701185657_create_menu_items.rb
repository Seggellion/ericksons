class CreateMenuItems < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_items do |t|
      t.string :title
      t.string :url
      t.references :menu, null: false, foreign_key: true
      t.integer :parent_id
      t.integer :position

      t.timestamps
    end
    change_column :pages, :content, :text
  end
end
