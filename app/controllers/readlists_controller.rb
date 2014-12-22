class ReadlistsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @readlist = current_user.readlists.create!(issue_id: readlist_params, read: true)

    redirect_to library_path
  end

  def destroy
    @readlist = current_user.readlists.where(issue_id: readlist_params)
    current_user.readlists.destroy(@readlist)

    redirect_to library_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def readlist_params
      params.require(:issue)
    end
end
