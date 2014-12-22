class LibrariesController < ApplicationController
  before_filter :authenticate_user!

  # GET /libraries/1
  # GET /libraries/1.json
  def show
    @volumes = current_user.volumes.includes(:issues)
  end

  def create
    @library = current_user.libraries.create!(volume_id: library_params)

    redirect_to library_path
  end

  def destroy
    @library = current_user.libraries.where(volume_id: library_params)
    current_user.libraries.destroy(@library)

    redirect_to library_path
  end

  def current_user
    @current_user ||= User.where(id: super.id).includes(:volumes).first
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      params.require(:volume)
    end
end
