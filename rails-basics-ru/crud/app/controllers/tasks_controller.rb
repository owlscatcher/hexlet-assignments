class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @task.status = 'new'
    @task.completed = false
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
      flash[:success] = "Task created successfully"
    else
      render :new
      flash[:failure] = "Task creation failed"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task)
      flash[:success] = "Task updated successfully"
    else
      render :edit
      flash[:failure] = "Task update failed"
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      redirect_to tasks_path
      flash[:success] = "Task deleted successfully"
    else
      flash[:failure] = "Task deletion failed"
    end
  end

  private

  def task_params
    params.require(:task).permit(
      :id,
      :name,
      :description,
      :status,
      :creator,
      :performer,
      :completed,
    )
  end
end
