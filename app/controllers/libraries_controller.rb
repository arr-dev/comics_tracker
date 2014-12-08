class LibrariesController < ApplicationController
  before_filter :authenticate_user!

  # GET /libraries/1
  # GET /libraries/1.json
  def show
    @volumes = current_user.volumes
  end

  def create
    @library = current_user.libraries.create!(volume_id: params[:volume])

    redirect_to library_path
  end

  def destroy
    @library = current_user.libraries.where(volume_id: params[:volume])
    current_user.libraries.destroy(@library)

    redirect_to library_path
  end

  def current_user
    @current_user ||= User.where(id: super.id).includes(:volumes).first
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      params[:library]
    end
end
