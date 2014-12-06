class VolumesController < ApplicationController
  def index
    @volumes = Volume.all
  end

  def show
    @volume = Volume.find(params[:id])
  end
end
