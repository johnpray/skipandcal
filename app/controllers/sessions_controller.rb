class SessionsController < ApplicationController
	def new
	end

  def create
    if authenticate(params)
      sign_in
      flash[:success] = "Welcome back, Master."
      redirect_to root_path
    else
      flash.now[:error] = "Credentials not recognized. Your unauthorized attempt to gain access has been reported to the proper authorities and Tom Nook's goons will soon be along to collect you. Please stay put."
      render 'new'
    end
  end

	def destroy
		sign_out
    flash[:success] = "Farewell, Master. Return soon."
  	redirect_to root_path
	end

  private

    def authenticate(params)
      params[:session][:username] == ADMIN_USERNAME && params[:session][:password] == ADMIN_PASSWORD
    end

    def sign_in
      cookies.permanent[:remember_token] = ADMIN_REMEMBER_TOKEN
    end

    def sign_out
      cookies[:remember_token] = ''
    end
end