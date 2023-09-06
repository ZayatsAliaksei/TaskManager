class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :authenticate_user!

  def show
    task = Task.find(params[:id])
    render json: { task: task }
  end

  def index
    tasks = Task.all
    render json: { tasks: tasks }
  end

  def create
    task = Task.new(task_params)
    task.author = current_user

    if task.save
      render json: { task: task }, status: :created
    else
      render json: { errors: task.errors }, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      render json: { task: task }
    else
      render json: { errors: task.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: { message: 'Task deleted successfully' }
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :assignee_id)
  end
end
