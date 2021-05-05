class TasksController < ApplicationController
  def index
    @tasks = Task.all
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
    end
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
    @task.def destroy
      redirect_to tasks_path, notice:"削除しました！"
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :detail)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end