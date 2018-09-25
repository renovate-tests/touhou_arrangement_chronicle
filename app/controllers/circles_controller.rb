class CirclesController < ApplicationController
  def index
  end

  def new
    require_login
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    if verify_recaptcha(model: @circle) && @circle.save
      redirect_to circle_path(name: @circle.name_ja)
    else
      render :new
    end
  rescue ActiveRecord::RecordNotUnique
    @circle.errors.add(:name_ja, :taken)
    render :new
  end

  def show(name)
    @circle = Circle.includes(discographies: [:event]).find_by(name_ja: name.tr('／', '/'))
    render 'circles/discographies/index'
  end

  private

    def circle_params
      params.require(:circle).permit(:name_ja, :name_en, :circle_type, :site_url, :blog_url, :note_ja, :note_en)
    end
end
