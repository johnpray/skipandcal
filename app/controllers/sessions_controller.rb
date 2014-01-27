class SessionsController < ApplicationController
	def new
    if admin?
      flash[:success] = "Welcome back, Master. You are already logged in. Awaiting further instructions."
      redirect_to root_path
    end
	end

  def create
    if auth_hash # this is an oauth2 callback
      if auth_hash.provider.to_s == 'jpray_auth' && auth_hash.info.email.to_s == ENV['ADMIN_EMAIL']
        sign_in
        flash[:success] = "Well, aren't you all fancy with your OAuth2 server. *cough* I mean: Welcome back, Master."
        redirect_to root_path
      else
        flash.now[:error] = "The auth server recognized you, but I don't. EXTERMINATE!"
        render 'new'
      end
    else
      if authenticate(params)
        sign_in
        flash[:success] = "Welcome back, Master."
        redirect_to root_path
      else
        flash.now[:error] = "Credentials not recognized. Your unauthorized attempt to gain access has been reported to the proper authorities and Tom Nook's goons will soon be along to collect you. Please stay put."
        render 'new'
      end
    end
  end

	def destroy
		sign_out
    flash[:success] = "Farewell, Master. Return soon."
  	redirect_to root_path
	end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end

  private

    def authenticate(params)
      params[:session][:username] == ENV['ADMIN_USERNAME'] && params[:session][:password] == ENV['ADMIN_PASSWORD']
    end

    def sign_in
      cookies.permanent[:remember_token] = ENV['ADMIN_REMEMBER_TOKEN']
    end

    def sign_out
      cookies[:remember_token] = ''
    end
end