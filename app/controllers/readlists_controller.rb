class ReadlistsController < ApplicationController
  before_filter :authenticate_user!

  def create
    issue = Issue.find(readlist_params[:issue])
    library = current_user.libraries.where(volume: issue.volume).first

    Issue.transaction do
      current_user.readlists.create!(issue: issue, read: true)
      library.next_read(issue)
    end

    redirect_to :back
  end

  def destroy
    issue = Issue.find(readlist_params[:issue])
    library = current_user.libraries.where(volume: issue.volume).first
    Issue.transaction do
      current_user.readlists.where(issue: issue).destroy_all
      library.previous_read(current_user, issue)
    end

    redirect_to :back
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def readlist_params
    params.permit(:issue)
  end
end
