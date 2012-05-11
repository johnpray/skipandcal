class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private

    def admin
      if !admin?
        redirect_to root_path
      end
    end
end
