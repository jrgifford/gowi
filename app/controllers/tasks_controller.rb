class TasksController < ApplicationController
  respond_to :json
  
  
  def index
    respond_with Task.all
  end
  
  def show
    respond_with Task.find(params[:id])
  end
  
  def create
    task = Task.create(params[:task])
    message = {:channel => '/tasks/new', :data => task}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
    respond_with task
  end
  
  def update
    respond_with Task.update(params[:id], params[:task])
  end
  
  def destroy
    respond_with Task.destroy(params[:id])
  end
end
