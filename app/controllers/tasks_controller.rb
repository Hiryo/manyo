class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if params[:expired_at]
      @tasks = Task.latest
    else
      @tasks = Task.all
    end
    if params[:name].present? && params[:status].present?
      @tasks = Task.search_name_status(params[:name], params[:status])
    elsif params[:name].present?
      @tasks = Task.search_name(params[:name])
    elsif params[:status].present?
      @tasks = Task.search_status(params[:status])
    else
      @tasks = Task.latest
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "投稿しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @task = Task.new(task_params)
    render :new if @task.invalid?
  end

  def destroy
    @task.destroy
      redirect_to tasks_path, notice:"削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:name, :detail, :expired_at, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

