class AddIpAndCountryCodeToContactMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :contact_messages, :ip_address, :string
    add_column :contact_messages, :country_code, :string
    add_column :pages, :template, :string
    add_column :sections, :subtitle, :string
    add_column :sections, :body, :text
  end
end
