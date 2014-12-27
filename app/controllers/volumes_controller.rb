class VolumesController < ApplicationController
  def index
    @volumes = Volume.all
  end

  def show
    @volume = Volume.find(params[:id])
  end

  def current_user
    @current_user ||= User.where(id: super.id).includes(:volumes).first
  end
end
