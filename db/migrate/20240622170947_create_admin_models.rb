class CreateAdminModels < ActiveRecord::Migration[6.1]
  def change
    # Users table
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :uid, null: false
      t.string :provider
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :uid, unique: true

    # Pages table
    create_table :pages do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, foreign_key: true
      t.timestamps
    end

    # Posts table
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, foreign_key: true
      t.timestamps
    end

    # Posts table
    create_table :articles do |t|
      t.string :title
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
    

    # Media table
    create_table :media do |t|
      t.string :file
      t.references :user, foreign_key: true
      t.timestamps
    end

    # Comments table
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
