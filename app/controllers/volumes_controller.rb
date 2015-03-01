class VolumesController < ApplicationController
  def index
    @volumes = Volume.order(:id).page(params[:page])
  end

  def show
    @volume = Volume.find(params[:id])
  end

  def current_user
    @current_user ||= User.where(id: super.id).includes(:volumes).first
  end
end
