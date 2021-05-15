class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice:"削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
    flash[:notice] = "管理者画面です"
  end

  def set_user
    @user =  User.find(params[:id])
  end
end

