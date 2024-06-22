class SessionsController < ApplicationController
    def create
      auth = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.email = auth['info']['email']
        u.name = auth['info']['name']
      end
  
      session[:user_id] = user.id
      redirect_to admin_root_path, notice: 'Logged in!'
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out!'
    end
  
    def failure
      redirect_to root_path, alert: 'Authentication failed.'
    end
  end
  