class IssuesController < ApplicationController
  def index
    @issues = Issue.where(volume_id: params[:volume_id]).includes(:volume).all
  end

  def show
    @issue = Issue.includes(:volume).find(params[:id])
  end
end
