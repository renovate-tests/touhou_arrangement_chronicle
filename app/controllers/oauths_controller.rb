class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, notice: I18n.t('controllers.oauths.logged_in', provider: provider.titleize)
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, notice: I18n.t('controllers.oauths.logged_in', provider: provider.titleize)
      rescue
        redirect_to root_path, alert: I18n.t('controllers.oauths.failed', provider: provider.titleize)
      end
    end
  end

  private

    def auth_params
      params.permit(:code, :provider, :oauth_token, :oauth_verifier)
    end
end
