class SessionsController < ApplicationController
      layout 'utility'
    def create
      auth = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.email = auth['info']['email']
        u.first_name = auth['info']['name']
        u.provider = "discord"
        u.user_type = User.admin_exists? ? 1 : 0 # 0 for admin, 1 for regular user
        u.discord_avatar = auth['info']['image'] # Save the avatar URL
      end
      if user.discord_avatar != auth['info']['image']
        user.update(discord_avatar: auth['info']['image']) # Update the avatar if different
      end

      user.update(ip_address: request.remote_ip, last_login: Time.current) # Capture the user's IP address)
      session[:user_id] = user.id
      redirect_to admin_root_path if user.admin?
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out!'
    end
  
    def failure
      redirect_to root_path, alert: 'Authentication failed.'
    end
  end
  