module Settings
  class AccountController < ApplicationController
    before_action :require_login

    def index
      render layout: 'user_page'
    end

    def destroy
      user = current_user
      if logout
        user.destroy!
        redirect_to root_path
      else
        render :index
      end
    end
  end
end
