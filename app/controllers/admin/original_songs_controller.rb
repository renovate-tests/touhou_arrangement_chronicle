module Admin
  class OriginalSongsController < Admin::ApplicationController
    before_action :default_params

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = OriginalSong.
    #     page(params[:page]).
    #     per(10)
    # end
    def create
      super
    rescue ActiveRecord::RecordNotUnique
      resource = resource_class.new(resource_params)
      resource.errors.add(:code, :taken)
      render :new, locals: {
        page: Administrate::Page::Form.new(dashboard, resource),
      }
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   OriginalSong.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def default_params
      params[:order] ||= "code"
      params[:direction] ||= "asc"
    end
  end
end
