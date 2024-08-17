# config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do

    provider :discord, Setting.get('discord_client_id'), Setting.get('discord_client_secret'), scope: 'identify email'
  end
  