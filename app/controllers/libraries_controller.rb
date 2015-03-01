class LibrariesController < ApplicationController
  before_filter :authenticate_user!

  # GET /libraries/1
  # GET /libraries/1.json
  def show
    @volumes = current_user.volumes.order(:id).page(params[:page])
    @issues = @volumes.each_with_object({}) do |volume, memo|
      memo[volume.id] = Issue.where(volume: volume)
                        .includes(:volume)
                        .page(params["issues_page_#{volume.id}"])
    end
  end

  def unread
    @volumes = Volume.unread(current_user).order(:id).page(params[:page])
    @issues = @volumes.each_with_object({}) do |volume, memo|
      memo[volume.id] = Issue.unread(current_user)
                        .where(volume: volume)
                        .includes(:volume)
                        .page(params["issues_page_#{volume.id}"])
    end

    render action: "show"
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
