class SessionsController < ApplicationController
  def new
    redirect_back_or_to(root_path) if logged_in?
    render :new, layout: 'authentication'
  end

  def create
    @user = login(params[:name_or_email], params[:password])
    if @user
      redirect_back_or_to(root_path, notice: "ログインしました")
    else
      flash.now[:error] = "ユーザー名かパスワードが間違っています"
      render :new, layout: 'authentication'
    end
  end

  def destroy
    if logged_in?
      logout
      redirect_to(root_path, notice: "ログアウトしました")
    else
      redirect_back_or_to(root_path)
    end
  end
end
