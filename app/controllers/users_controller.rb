class UsersController < ApplicationController
  def new
    @user = User.new
    render :new, layout: 'authentication'
  end

  def create
    @user = User.new(user_params)

    if verify_recaptcha(model: @user) && @user.save
      auto_login(@user)
      redirect_to root_path, notice: I18n.t('controllers.users.create.success')
    else
      render :new, layout: 'authentication'
    end
  end

  def show(name)
    @user = User.find_by!(name: name)
    render layout: 'user_page'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
