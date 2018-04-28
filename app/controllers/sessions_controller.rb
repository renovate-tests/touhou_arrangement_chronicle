class SessionsController < ApplicationController
  def new
    redirect_back_or_to(root_path) if current_user
  end

  def create
    if @user = login(params[:name_or_email], params[:password])
      redirect_back_or_to(root_path, notice: I18n.t('controllers.sessions.login.success'))
    else
      msg = I18n.t('controllers.sessions.login.failed')
      flash.now[:error] = msg
      render action: 'new'
    end
  end

  def destroy
    if current_user
      logout
      redirect_to(root_path, notice: I18n.t('controllers.sessions.logout'))
    else
      redirect_back_or_to(root_path)
    end
  end
end
