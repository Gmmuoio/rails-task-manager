class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit_multiple update_multiple destroy]
  def index
    @tasks = Task.all
  end

  def show;
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit_multiple
    task_ids = params[:task_ids]
    @tasks = Task.where(id: task_ids)
    if @tasks.present? && @tasks.length == task_ids.length
      render "tasks/edit_multiple"
    else
      redirect_to tasks_path, alert: "One or more selected tasks do not exist"
    end
  end

  def update_multiple
    @tasks.update_all(completed: true)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other

  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.where(id: params[:tasks_ids])
  end
end
