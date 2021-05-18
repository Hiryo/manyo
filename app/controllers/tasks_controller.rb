class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 8

  def index
    if params[:title].present? && params[:status].present?
      @tasks = Task.search_title_status(params[:title], params[:status], current_user.id)
    elsif params[:title].present? && params[:title].present? != 0
      @tasks = Task.search_title(params[:title], current_user.id)
    elsif params[:status].present? && params[:status].present? != 0
      @tasks = Task.search_status(params[:status], current_user.id)
    elsif  params[:expired_at]
      @tasks = current_user.tasks.order(expired_at: :DESC)
    elsif params[:priority]
      @tasks = current_user.tasks.order(:priority)
    else
      @tasks = current_user.tasks.all.includes(:user)
    end
    @tasks = @tasks.page(params[:page]).per(10)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

  def destroy
    @task.destroy
      redirect_to tasks_path, notice:"削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:title, :detail, :expired_at, :status, :priority, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

