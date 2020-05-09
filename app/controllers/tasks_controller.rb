class TasksController < ApplicationController
  before_action :set_project, only: [:create,:edit,:destroy,:update]
  def create
    if @task = @project.tasks.create(task_params)
      flash[:success] = "Task was created."
    end

    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted."
    else
      flash[:error] = "Task was not deleted."
    end
    redirect_to @project
  end
  private
  
  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:content)
  end
end
