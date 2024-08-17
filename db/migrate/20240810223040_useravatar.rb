class Useravatar < ActiveRecord::Migration[7.1]
  def change
      add_column :users, :discord_avatar, :string
      add_column :users, :ip_address, :string
      add_column :users, :country, :string
      add_column :users, :last_login, :datetime
  end
end
