class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show; end

  def edit; end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
      flash[:success] = 'Task was successfully created.'
    else
      render :new
      flash[:error] = 'Task was not created.'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task
      flash[:success] = 'Task was successfully updated.'
    else
      render :edit
      flash[:error] = 'Task update failed'
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path
      flash[:success] = 'Task deleted'
    else
      flash[:error] = 'Task could not be deleted'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :user_id, :status_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
