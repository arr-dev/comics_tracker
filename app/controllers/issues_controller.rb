class IssuesController < ApplicationController
  def index
    @issues = Issue.includes(:volume).all
  end

  def show
    @issue = Issue.includes(:volume).find(params[:id])
  end
end
