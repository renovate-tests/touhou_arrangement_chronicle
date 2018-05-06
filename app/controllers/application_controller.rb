class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :reload_locales, if: -> { Rails.env.development? }

  private

    def reload_locales
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
      I18n.load_path.uniq!
      I18n.reload!
    end

    def not_authenticated
      redirect_to root_path
    end
end
