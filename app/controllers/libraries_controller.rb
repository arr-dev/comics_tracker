class LibrariesController < ApplicationController
  before_filter :authenticate_user!

  # GET /libraries/1
  # GET /libraries/1.json
  def show
    @volumes = current_user.volumes.includes(:issues)
  end

  def unread
    @issues = Issue.unread(current_user).includes(:volume)
    @volumes = Volume.where(id: @issues.map(&:volume_id).uniq)

    render action: 'show'
  end

  def create
    @library = current_user.libraries.create!(volume_id: library_params[:volume])

    redirect_to library_path
  end

  def destroy
    current_user.libraries.where(volume_id: library_params[:volume]).destroy_all

    redirect_to library_path
  end

  def current_user
    @current_user ||= User.where(id: super.id).includes(:issues, :volumes).first
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      params.permit(:volume)
    end
end
