class CreateContactMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_messages do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :properties
      t.string :subject
      t.text :body
      t.datetime :read_at

      t.timestamps
    end


    add_column :pages, :published, :boolean
    add_column :services, :published, :boolean
    add_column :posts, :published, :boolean
    add_column :articles, :published, :boolean
    add_column :users, :user_type, :integer
    remove_column :users, :name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

  end
end
