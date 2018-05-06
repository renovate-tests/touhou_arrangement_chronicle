module Admin
  class ArrangersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Arranger.
    #     page(params[:page]).
    #     per(10)
    # end
    def create
      super
    rescue ActiveRecord::RecordNotUnique
      resource = resource_class.new(resource_params)
      resource.errors.add(:artist, :taken)
      render :new, locals: {
        page: Administrate::Page::Form.new(dashboard, resource),
      }
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Arranger.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
