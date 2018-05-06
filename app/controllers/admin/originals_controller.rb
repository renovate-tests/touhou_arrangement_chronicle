module Admin
  class OriginalsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Original.
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
    #   Original.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
