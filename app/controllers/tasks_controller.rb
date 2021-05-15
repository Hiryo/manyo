class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 8

  def index
    if params[:name].present? && params[:status].present?
      @tasks = Task.search_name_status(params[:name], params[:status])
    elsif params[:name].present? && params[:name].present? !=0
      @tasks = Task.search_name(params[:name])
    elsif params[:status].present? && params[:status].present? !=0
      @tasks = Task.search_status(params[:status])
    elsif  params[:expired_at]
      @tasks = Task.order(expired_at: :DESC)
    elsif params[:priority]
      @tasks = Task.order(:priority)
    else
      @tasks = current_user.tasks.all
    end

    @tasks = @tasks.page(params[:page]).per(2)
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
    # @task = current_user.tasks.find_by(task_id: @task.id)

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
    params.require(:task).permit(:name, :detail, :expired_at, :status, :priority, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

