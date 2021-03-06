class JobsController < ApplicationController
  def index
    @jobs = Job.available
  end

  def archived
    @jobs = Job.find(:all, :conditions => { :status => 'archived' })
    render :index
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

end
